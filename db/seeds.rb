# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# seed users data
(1..20).each do |index|
  User.create(name: "Demo person #{index}")
end

user_ids = User.all.pluck(:id)

User.all.each do |user|
  # seed sleep_time, waking_time of the users in last 10 days
  (1..10).each do |index|

    # assume last ten day all users sleep at 10 o'clock
    sleep_time = Time.now.beginning_of_day - index.days - 2.hours

    # assume waking_time is from 7 to 8 hours from the sleep_time
    waking_time = sleep_time + 8.hours + rand(-60..60).minutes
    SleepTracker.create(user: user, sleep_time: sleep_time, waking_time: waking_time)
  end

  # SEED random RELATIONSHIP for users
  # user following 5 person and have 5 followers
  user_ids_without_current_user = user_ids - [user.id]

  #sample id of following the current_user
  following_ids = user_ids_without_current_user.sample(5)

  #sample id of current_user following
  follower_ids = user_ids_without_current_user.sample(5)

  follower_ids.each do |id|
    Relationship.create(following_id: user.id, followed_id: id)
  end

  following_ids.each do |id|
    Relationship.create(following_id: id, followed_id: user.id)
  end
end

