class ClockedIn < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :user_id, uniqueness: { scope: :end_date, message: "should end the current time tracking"}, on: :create
end
