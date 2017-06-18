class User < ApplicationRecord
  attr_accessor :remember_token
  before_create :remember_user
  has_secure_password

  def self.create_token
    SecureRandom.urlsafe_base64
  end

  def self.digest(token)
    Digest::SHA1.hexdigest(token)
  end

  def remember_user
    self.remember_token = User.create_token
    self.remember_digest = User.digest(remember_token)

    # update_attribute(:remember_digest, User.digest(remember_token))

    # session[:remember_digest] = remember_digest
  end

end
