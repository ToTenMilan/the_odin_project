class Invitation < ApplicationRecord
  belongs_to :attendee, class_name: "User" # join tables
  belongs_to :attended_event, class_name: "Event" # join tables
end
