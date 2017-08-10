class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed # override ungramatical 'followeds' with 'following' using `source` option. This is because Rails can't derive by itself the column name from 'following' method, so we need to provide `source` option for it to know to look for `followed_id` column in relationships table
  has_many :followers, through: :passive_relationships, source: :follower # `source` option can be omitted because rails can singularize `followers` by itself and look for follower_id column in relationships table
  attr_accessor :remember_token, :activation_token, :reset_token # virtual (not in db) attributes used below
  before_save   :downcase_email
  before_create :create_activation_digest
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  class << self # everything in this scope is a class method and is (almost)equivalent to: `def User.digest` & `def User.new_token` OR `def self.digest` & `def self.new_token` (without defining `class << self` scope)

    # digest password used in test/fixtures/users.yml
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    # returns a random token, 22 alphanums(random case)
    def new_token
      SecureRandom.urlsafe_base64
    end

  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    # remember_digest is the same as self.remember_digest above (?)
    # remember_token is only a local variable. It refers to remember_token from attr_accessor so its common to name this method attribute the same
    digest = self.send("#{attribute}_digest") # may be without `self` since in User model
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def activate
    # update_attribute(:activated, true)
    # update_attribute(:activated_at, Time.zone.now)
    update_columns(activated: true, activated_at: Time.zone.now) # exercise 11.3.3.1
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def create_reset_digest
    self.reset_token = User.new_token
    # update_attribute(:reset_digest, User.digest(reset_token))
    # update_attribute(:reset_sent_at, Time.zone.now)
    update_columns(reset_digest: User.digest(reset_token), reset_sent_at: Time.zone.now) # exercise 12.3.3.1
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
    # i.e
    # reset_sent_at == 15:00
    # Time.now == 16:00
    # 2.hours.ago => max 14:00
    # 15:00 > 14:00
    # returns false (not expired)
    #
    # reset_sent_at == 15:00
    # Time.now == 18:00
    # 2.hours.ago => max 16:00
    # 15:00 < 16:00
    # returns true (expired)
  end

  def feed
    # `User.first.following_ids` => shorthand of `User.first.following.map(&:id)`

    # 1ST VERSION
    # good when only one record needs to be pulled
    # Micropost.where("user_id IN (?) OR user_id = ?", following_ids, id) # This is good when we are pulling only one record

    # 2ND VERSION
    # good when more than record needs to be pulled
    # Micropost.where("user_id IN (:following_ids) OR user_id = :user_id", following_ids: following_ids, user_id: id)

    # 3RD VERSION
    # best for scaling horizontally
    following_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
    Micropost.where("user_id IN (#{following_ids}) OR user_id = :user_id", user_id: id) # more efficent than the query below

    # For details refer to section 14.3.3 Subselects of the railstutorial book

    # ex 14.3.2.1 Posts from self test will fail
    # ex 14.3.2.2 Post from followed user will fail
    # Micropost.all # exercise 14.3.2.3 make third test block fail
  end

  def follow(other_user)
    following << other_user # as in console `user.following << other_user`
  end

  def unfollow(other_user)
    following.delete(other_user) # as in console `user.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user) # as in console `user.include?(other_user)
  end

  private

    def downcase_email
      # self.email = email.downcase
      self.email.downcase! # exercise 11.1.2.3
    end

    def create_activation_digest
      self.activation_token = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
end

# /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
