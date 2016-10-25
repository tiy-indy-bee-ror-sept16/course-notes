class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.text :bio

      t.timestamps
    end
    remove_column :posts, :author
    add_column :posts, :author_id, :integer
  end
end
