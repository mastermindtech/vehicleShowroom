json.array!(@showrooms) do |showroom|
  json.extract! showroom, :id, :name
  json.url showroom_url(showroom, format: :json)
end
