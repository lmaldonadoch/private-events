class Event < ApplicationRecord
	# has_many: user
	belongs_to :creator, class_name: "User"
	has_many :attendees, through: :invites, source: :user
  has_many :invites
end
