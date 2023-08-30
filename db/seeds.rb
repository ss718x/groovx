# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

User.destroy_all
Room.destroy_all

user = User.find_or_create_by(email: 'user@me.com') do |user|
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

# placeholders for album covers, room names, and descriptions
# later they will be generated dynamically via Spotify

album_covers = [
  "https://i.ibb.co/PtBGgYX/clash.pnga",
  "https://i.ibb.co/cbqGv03/floyd.png",
  "https://i.ibb.co/2chw0p7/joy-division.png",
  "https://i.ibb.co/CVYWsVw/judas-priest.png",
  "https://i.ibb.co/Y7kDrtq/leadbelly.jpg",
  "https://i.ibb.co/bvpHtxv/nas.png",
  "https://i.ibb.co/b5Y3KG2/nevermind.png",
  "https://i.ibb.co/JKmHb0n/thelonious.png"
]

room_names = [
  "PUNK RAWK!",
  "Classic Rock Haus",
  "Dark Dance Halls",
  "Metal Mania",
  "BLUES BAYOU",
  "straight from da streetz",
  "Indieheads",
  "Bebop Jazz"
]

descriptions = [
  "Where the mosh pits never end!",
  "relive the legendary rock anthems.",
  "embrace the night..",
  "strictly metal!",
  "all blues genres",
  "hip hop new and old skool welcome",
  "title says it all",
  "snap your fingers to the beat"
]

8.times do |i|
  creator = users.sample
  room = Room.create(
    name: room_names[i],
    tag: Faker::Lorem.words(number: 1).first,
    description: descriptions[i],
    max_djs: rand(1..10),
    image_url: album_covers[i],
    creator: creator
  )
  other_users = users.to_a - [creator]
  room.users << other_users.sample(rand(1..5))
end
