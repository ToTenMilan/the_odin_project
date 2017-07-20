class Event < ApplicationRecord
  has_many :invitations, foreign_key: :attended_event_id # referes to invitations table
  has_many :attendees, through: :invitations, source: :attendee # refers to users table through invitations table, ('source' seems optional)
  belongs_to :creator, class_name: "User" # refers to users table directly
  scope :all_upcoming_events, -> { where("date > ?", Time.now) } # scope, lets use 'all_upcoming_events' method
  scope :all_past_events, -> { where("date < ?", Time.now) } # scope, lets use 'all_past_events' method

  # def self.all_upcoming_events
  #   Event.where("date > ?", Time.now)
  # end

  # def self.all_past_events
  #   Event.where("date < ?", Time.now)
  # end

end
