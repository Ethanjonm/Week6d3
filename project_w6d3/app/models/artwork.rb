class Artwork < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :image_url, presence: true, uniqueness: true
    validates :artist_id, presence: true, uniqueness: true
end
