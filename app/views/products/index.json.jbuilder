json.array!(@products) do |product|
  json.extract! product, :id, :name, :about, :price, :image
  json.url product_url(product, format: :json)
end
