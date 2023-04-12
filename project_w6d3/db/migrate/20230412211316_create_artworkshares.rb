class CreateArtworkshares < ActiveRecord::Migration[7.0]
  def change
    create_table :artworkshares do |t|
      t.bigint :artwork_id, null: false
      t.bigint :viewer_id, null: false


      t.timestamps
    end

    add_foreign_key :artworkshares, :users, column: :viewer_id
    add_foreign_key :artworkshares, :artworks, column: :artwork_id

    add_index :artworkshares, :artwork_id
    add_index :artworkshares, :viewer_id
  end
end
