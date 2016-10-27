class ChangeYearReleasedToReleaseYear < ActiveRecord::Migration[5.0]
  def change
    rename_column :albums, :year_released, :release_year
  end
end
