class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id
  has_many :attended_events, through: :attended_events
  has_many :objects, class_name: "object", foreign_key: "reference_id"
end
