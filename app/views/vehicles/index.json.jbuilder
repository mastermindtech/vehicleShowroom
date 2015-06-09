json.array!(@vehicles) do |vehicle|
  json.extract! vehicle, :id, :name, :arrival_date, :physically_in_showroom, :showroom
  json.url vehicle_url(vehicle, format: :json)
end
