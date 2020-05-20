class Event < ApplicationRecord
	# has_many: user
	belongs_to :creator, class_name: "User"
end
