class SleepTracker < ApplicationRecord
  before_save :generate_duration

  belongs_to :user

  def generate_duration
    duration = waking_time - sleep_time
  end
end
