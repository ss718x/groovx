class Room < ApplicationRecord
  belongs_to :creator, class_name: 'User', optional: true
  # has_and_belongs_to_many :users
  has_many :rooms_users
  has_many :djs, through: :rooms_users, source: :user
end
