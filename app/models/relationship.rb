# == Schema Information
#
# Table name: relationships
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  followed_id  :integer
#  following_id :integer
#
# Indexes
#
#  index_relationships_on_followed_id   (followed_id)
#  index_relationships_on_following_id  (following_id)
#
class Relationship < ApplicationRecord
  belongs_to :following, class_name: 'User'
  belongs_to :follower, class_name: 'User', foreign_key: 'followed_id'
end
