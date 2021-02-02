json.followed_users do
  json.array! @followed_users do |user|
    json.id user.id
    json.name user.name
    json.sleep_trackers do
      json.array! user.sleep_trackers do |tracker|
        json.id tracker.id
        json.sleep_time tracker.sleep_time
        json.waking_time tracker.waking_time
        json.duration tracker.duration
      end
    end
  end
end
