class User < ApplicationRecord
  has_many :invitations, foreign_key: :guest_id
  has_many :visited_dinners, through: :invitations
  has_many :hosted_dinners, foreign_key: :host_id, class_name: "Dinner"
end
