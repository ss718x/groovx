class Room < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  # has_and_belongs_to_many :users
  has_many :rooms_users
  has_many :djs, through: :rooms_users, source: :user
  has_many :messages, dependent: :destroy
end
