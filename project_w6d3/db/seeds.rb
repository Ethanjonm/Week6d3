# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#fsggsdgds
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# require 'faker'

# # Create 10 users
# 10.times do
#   User.create!(
#     username: Faker::Internet.username,
#   )
# end

# 10.times do
#   Artwork.create(title: Faker::Lorem.words(number: 3).join(' '))
# end 

# 10.times do
#   Artwork.create(image_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['artwork']))
# end

User.destroy_all
Artwork.destroy_all 
Comment.destroy_all 
Artworkshare.destroy_all 

vin = User.create(username: 'Vincent')

artwork_1 = Artwork.create(title: 'untitled', image_url: 'www.facebook.com', artist_id: vin.id)

artwork_4 = Artwork.create!(title: 'untitled_2', image_url: 'www.face.com', artist_id: vin.id)

Artworkshare.create(artwork_id: artwork_1.id, viewer_id: vin.id) 

Comment.create!(artwork_id: artwork_1.id, author_id: vin.id, body:'nice pic.')

kyle = User.create(username: 'Kyle')

artwork_2 = Artwork.create(title: 'blue', image_url: 'www.blue.com', artist_id: kyle.id)

Artworkshare.create(artwork_id: artwork_2.id, viewer_id: kyle.id)

Comment.create!(artwork_id: artwork_2.id, author_id: vin.id, body:'lame, but still cool.')

joe = User.create(username: 'Joe')

artwork_3 = Artwork.create(title: 'green', image_url: 'www.green.com', artist_id: joe.id)

Artworkshare.create(artwork_id: artwork_3.id, viewer_id: joe.id)

Comment.create(artwork_id: artwork_2.id, author_id: kyle.id, body:'I hate it. But I made it')