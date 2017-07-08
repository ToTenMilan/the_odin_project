class Dinner < ApplicationRecord
  has_many :invitations, foreign_key: :visited_dinner_id
  has_many :guests, through: :invitations, source: :guest
  belongs_to :host, class_name: "User"
end
