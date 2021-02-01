class CreateSleepTrackers < ActiveRecord::Migration[6.0]
  def change
    create_table :sleep_trackers do |t|
      t.integer :user_id, index: true
      t.timestamp :sleep_time
      t.timestamp :waking_time
      t.integer :duration

      t.timestamps
    end
  end
end
