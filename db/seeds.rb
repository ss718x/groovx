# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

user = User.find_or_create_by(email: 'groovx@example.com') do |user|
  user.password = '00000000'
  user.password_confirmation = '00000000'
  user.name = 'admin'
end

10.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'password123',
    password_confirmation: 'password123',
    name: Faker::Name.name,
  )
end

users = User.all

50.times do
  creator = users.sample
  room = Room.create(
    name: Faker::Lorem.words(number: 2).join(' '),
    tag: Faker::Lorem.words(number: 1).first,
    description: Faker::Lorem.sentences(number: 1).first,
    image_url: Faker::LoremFlickr.image(size: "200x200", search_terms: ['room']),
    creator: creator
  )
  other_users = users.to_a - [creator]
  room.users << other_users.sample(rand(1..5))
end
