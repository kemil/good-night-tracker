class User < ApplicationRecord
  has_many :clocked_ins
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followings, through: :followed_users
  has_many :following_users, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :following_users

  validates :name, presence: true
end
