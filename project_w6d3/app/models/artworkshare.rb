# == Schema Information
#
# Table name: artworkshares
#
#  id         :bigint           not null, primary key
#  artwork_id :bigint           not null
#  viewer_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artworkshare < ApplicationRecord
    validates :artwork_id, presence: true, uniqueness: true
    validates :viewer_id, presence: true, uniqueness: true

    belongs_to :artwork,
        foreign_key: :artwork_id,
        class_name: :Artwork

    belongs_to :viewer,
        foreign_key: :viewer_id,
        class_name: :User
end
