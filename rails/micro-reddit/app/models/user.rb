class User < ApplicationRecord
  validates :username, presence: true
  has_many :posts
  has_many :comments
end
