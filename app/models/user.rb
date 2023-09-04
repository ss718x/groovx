class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :created_rooms, class_name: 'Room', foreign_key: 'creator_id'
  has_many :message
  # has_and_belongs_to_many :rooms
  has_many :rooms_user
end
