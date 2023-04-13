# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  author_id  :bigint           not null
#  artwork_id :bigint           not null
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord

  validates :artwork_id, presence: true, uniqueness: true 
  validates :author_id, presence: true

  def self.comments_for_user_id(user_id)
        Comment.select('*')
        .joins(:artworkshares)
        .where(users: {id: user_id} )
  end

   def self.comments_for_artwork_id(artwork_id)
        Comment.select('*')
        .joins(:artworkshares)
        .where(users: {id: artwork_id} )
  end


  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User 

  belongs_to :artwork, 
    foreign_key: :artwork_id, 
    class_name: :Artwork 

  



end
