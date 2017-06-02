class User < ApplicationRecord
  attr_accessor :remember_token # used in `remember` method below
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

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
  def authenticated?(remember_token)
    # remember_digest is the same as self.remember_digest above
    # remember_token is only a local variable. It refers to remember_token from attr_accessor so its common to name this method attribute the same
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end

# /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
