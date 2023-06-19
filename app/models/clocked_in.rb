class ClockedIn < ApplicationRecord
  include ActionView::Helpers::DateHelper

  belongs_to :user

  validates :user_id, presence: true
  validates :user_id, uniqueness: { scope: :end_date, message: "should end the current time tracking"}, on: :create

  def duration
    self.end_date.nil? ? nil : distance_of_time_in_words(self.start_date, self.end_date)
  end
end
