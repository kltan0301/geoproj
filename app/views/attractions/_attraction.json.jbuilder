json.extract! attraction, :id, :latitude, :longitude, :address, :description, :category, :created_at, :updated_at
json.url attraction_url(attraction, format: :json)