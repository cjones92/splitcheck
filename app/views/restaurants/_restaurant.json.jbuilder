json.extract! restaurant, :id, :name, :location, :votes_for_splitting, :votes_against_splitting, :splitting_average, :float, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
