class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.text :bio
      t.integer :year_start
      t.integer :year_end

      t.timestamps
    end
  end
end
