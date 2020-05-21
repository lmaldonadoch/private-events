class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id
  has_many :invites
  has_many :attended_events, through: :invites, source: :event

  validates :name, presence: true
  validates :email, presence: true

end
