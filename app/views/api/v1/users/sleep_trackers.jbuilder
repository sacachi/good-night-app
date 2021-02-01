json.sleep_trackers do
  json.array! @sleep_trackers do |record|
    json.id record.id
    json.sleep_time record.sleep_time
    json.waking_time record.waking_time
    json.duration record.duration
  end
end
json.total @total
