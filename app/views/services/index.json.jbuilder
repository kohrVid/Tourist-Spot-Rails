json.array!(@services) do |service|
  json.extract! service, :id, :name, :price, :contents, :guide, :room, :food
  json.url service_url(service, format: :json)
end
