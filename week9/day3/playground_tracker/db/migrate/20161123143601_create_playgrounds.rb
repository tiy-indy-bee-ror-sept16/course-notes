class CreatePlaygrounds < ActiveRecord::Migration[5.0]
  def change
    create_table :playgrounds do |t|
      t.decimal :lat, :precision => 15, :scale => 10
      t.decimal :lng, :precision => 15, :scale => 10
      t.string :name
      t.text :description
      t.string :raw_address

      t.timestamps
    end
  end
end
