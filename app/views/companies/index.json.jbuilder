json.array!(@companies) do |company|
  json.extract! company, :id, :name, :cnpj, :category_id, :location, :latitude, :longitude
  json.url company_url(company, format: :json)
end
