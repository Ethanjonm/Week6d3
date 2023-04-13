# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    validates :username, presence: true

    has_many :artworks,
        foreign_key: :artist_id,
        class_name: :Artwork,
        dependent: :destroy,
        inverse_of: :artist

    has_many :artwork_views,
        foreign_key: :viewer_id,
        class_name: :Artworkshare,
        dependent: :destroy,
        inverse_of: :viewer

    has_many :shared_artworks,
        through: :artwork_views,
        source: :artwork,
        dependent: :destroy

    has_many :comments, 
        foreign_key: :author_id, 
        class_name: :Comment,
        dependent: :destroy,
        inverse_of: :author 

    
end
