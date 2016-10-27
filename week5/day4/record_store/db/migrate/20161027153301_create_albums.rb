class CreateAlbums < ActiveRecord::Migration[5.0]
  def up
    drop_table :albums
    change
  end
  def change
    create_table :albums do |t|
      t.string :name
      t.integer :rating
      t.integer :year_released
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
