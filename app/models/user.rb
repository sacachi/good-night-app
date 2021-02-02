# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_many :sleep_trackers, -> { order(created_at: :desc).limit(100) }
  has_many :followings, class_name: 'Relationship', foreign_key: 'following_id', dependent: :destroy
  has_many :followeds, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :following_users, through: :followeds
  has_many :followed_users, through: :followings
end
