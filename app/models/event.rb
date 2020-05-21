class Event < ApplicationRecord
	# has_many: user
	belongs_to :creator, class_name: "User"
	has_many :attendees, through: :invites, source: :event_attendee
    has_many :invites
end
