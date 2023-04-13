# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: :artist_id,
    message: "title cannot be used twice" }
    validates :image_url, presence: true, uniqueness: true
    validates :artist_id, presence: true

    def self.artworks_for_user_id(user_id)
        Artwork.select('*')
        .joins(:artworkshares)
        .where(users: {id: user_id} )
    end

    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User

    has_many :artworkshares,
        foreign_key: :artwork_id,
        class_name: :Artworkshare,
        dependent: :destroy, 
        inverse_of: :artwork 

    has_many :shared_viewers,
        through: :artworkshares,
        source: :viewer,
        dependent: :destroy 

    has_many :comments, 
        foreign_key: :artwork_id, 
        class_name: :Comment,
        dependent: :destroy,
        inverse_of: :artwork 



end
