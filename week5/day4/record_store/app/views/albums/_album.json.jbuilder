json.extract! album, :id, :name, :rating, :year_releasted, :artist_id, :created_at, :updated_at
json.url album_url(album, format: :json)