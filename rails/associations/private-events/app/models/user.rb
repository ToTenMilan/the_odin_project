class User < ApplicationRecord
  # has_many :events
  has_many :invitations, foreign_key: :attendee_id # refers to invitations table
  has_many :attended_events, through: :invitations, source: :attended_event # refers to events table through invitations, ('source' seems optional)
  has_many :created_events, foreign_key: :creator_id, class_name: "Event" #refers to events table directly

  def upcoming_events
    # puts "UPCOMING EVENTS"
    attended_events.select { |e| e.date.to_i > Time.now.to_i }
  end

  def previous_events
    attended_events.select { |e| e.date.to_i < Time.now.to_i }
  end

end
