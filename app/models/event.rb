class Event < ApplicationRecord
	# has_many: user
  belongs_to :creator, class_name: "User"
  has_many :attendees, through: :attended_events, source: :event_attendee
  has many :attended_events, foregin_key: :attendee_id
end
