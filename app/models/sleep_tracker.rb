# == Schema Information
#
# Table name: sleep_trackers
#
#  id          :bigint           not null, primary key
#  duration    :integer
#  sleep_time  :datetime
#  waking_time :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
# Indexes
#
#  index_sleep_trackers_on_user_id  (user_id)
#
class SleepTracker < ApplicationRecord
  before_save :generate_duration

  belongs_to :user

  def generate_duration
    self.duration = self.waking_time - self.sleep_time
  end
end
