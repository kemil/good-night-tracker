class ClockedIn < ApplicationRecord
  include ActionView::Helpers::DateHelper
  before_create :add_start_date
  before_update :set_end_date

  belongs_to :user

  validates :user_id, presence: true
  validates :user_id, uniqueness: { scope: :end_date, message: "Should end the current time tracking"}, on: :create

  def duration
    self.end_date.nil? ? nil : distance_of_time_in_words(self.start_date, self.end_date)
  end

  private

  def add_start_date
    self.start_date = DateTime.current()
    self.end_date = nil
  end

  def set_end_date
    self.end_date = DateTime.current()
  end
end
