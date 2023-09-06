# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'open-uri'

User.destroy_all
Room.destroy_all
RoomsUser.destroy_all
# Message.destroy_all

file = URI.open("https://images.unsplash.com/photo-1527980965255-d3b416303d12")


user = User.find_or_create_by(email: 'user@me.com') do |user|
  user.password = '000000'
  user.password_confirmation = '000000'
  user.name = 'Sebastian'
end

user.avatar.attach(io: file, filename: "me.png", content_type: "image/png")

file1 = URI.open("https://images.unsplash.com/photo-1524638431109-93d95c968f03")
file2 = URI.open("https://images.unsplash.com/photo-1633332755192-727a05c4013d")
file3 = URI.open("https://images.unsplash.com/photo-1438761681033-6461ffad8d80")
file4 = URI.open("https://images.unsplash.com/photo-1645378999488-63138abdecd2")
file5 = URI.open("https://images.unsplash.com/photo-1645378999496-33c8c2afe38d")
file6 = URI.open("https://images.unsplash.com/photo-1645378999013-95abebf5f3c1")
file7 = URI.open("https://images.unsplash.com/photo-1486486704382-8ee6f7754a45")
file8 = URI.open("https://images.unsplash.com/photo-1521038199265-bc482db0f923")
file9 = URI.open("https://images.unsplash.com/photo-1563351672-62b74891a28a")
file10 = URI.open("https://images.unsplash.com/photo-1579192181049-2aa87e49df2a")

avatars = [file1, file2, file3, file4, file5, file6, file7, file8, file9, file10]

10.times do |i|
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'password123',
    password_confirmation: 'password123',
    name: Faker::Name.name
  )
  user.avatar.attach(io: avatars[i].open, filename: "avatar_#{i}.png", content_type: "image/png")
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
  user = users.sample
  room = Room.create(
    name: room_names[i],
    tag: Faker::Lorem.words(number: 1).first,
    description: descriptions[i],
    max_djs: rand(1..10),
    image_url: album_covers[i],
    user_id: user.id
  )
  other_users = users.to_a - [user]
  room.djs << other_users.sample(rand(1..5))
end

# RoomsUser.new(user: user, room: Room.last)
