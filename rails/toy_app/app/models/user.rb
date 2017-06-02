class User < ApplicationRecord
  has_many :microposts
  validates :name, presence: true
  validates :email, presence: true

  # override as_json
  # def as_json(options={})
  #   { name: self.name, created_at: self.created_at }
  # end

  # add to default
  # def as_json(options={})
  #   super(only: [:name, :created_at])
  # end
end
