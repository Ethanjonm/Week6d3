class ChangeArtwork < ActiveRecord::Migration[7.0]
  def change
    remove_index :artworks, :artist_id 
    remove_index :artworks, :title 

    add_index :artworks, [:artist_id, :title], unique: true 
  end
end
