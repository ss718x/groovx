class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages, dependent: :destroy
  # has_and_belongs_to_many :rooms
  has_many :rooms, dependent: :destroy
  has_many :rooms_user
  has_many :created_rooms, class_name: 'Room', foreign_key: 'user_id'
  has_one_attached :avatar
  attr_accessor :genre
end
