class Invitation < ApplicationRecord
  belongs_to :guest, class_name: "User"
  belongs_to :visited_dinner, class_name: "Dinner"
end
