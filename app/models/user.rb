class User < ApplicationRecord
  has_many :sleep_trackers, dependent: :destroy
  has_many :following_users, class_name: 'Relationship', foreign_key: 'following_id', dependent: :destroy
  has_many :followed_users, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :followings, through: :following_users
  has_many :followers, through: :following_users
end
