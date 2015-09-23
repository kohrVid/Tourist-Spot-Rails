json.array!(@carousels) do |carousel|
  json.extract! carousel, :id, :image_url, :image_description
  json.url carousel_url(carousel, format: :json)
end
