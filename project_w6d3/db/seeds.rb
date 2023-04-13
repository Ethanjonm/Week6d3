# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

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


vin = User.create!(username: 'Vincent')

artwork_1 = Artwork.create!(title: 'untitled', image_url: 'www.facebook.com', artist_id: vin.id)

Artworkshare.create!(artwork_id: artwork_1.id, viewer_id: vin.id)

kyle = User.create!(username: 'Kyle')

artwork_2 = Artwork.create!(title: 'blue', image_url: 'www.blue.com', artist_id: kyle.id)

Artworkshare.create!(artwork_id: artwork_2.id, viewer_id: kyle.id)

joe = User.create!(username: 'Joe')

artwork_3 = Artwork.create!(title: 'green', image_url: 'www.green.com', artist_id: joe.id)

Artworkshare.create!(artwork_id: artwork_3.id, viewer_id: joe.id)