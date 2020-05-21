class Event < ApplicationRecord
  # has_many: user
  belongs_to :creator, class_name: 'User'
  has_many :attendees, through: :invites, source: :user
  has_many :invites

  scope :previous_events, ->(_time) { where('date < ?', Date.today) }
  scope :upcoming_events, ->(_time) { where('date >= ?', Date.today) }
end
