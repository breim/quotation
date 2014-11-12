json.array!(@quotes) do |quote|
  json.extract! quote, :id, :name, :description, :data_entega, :user_id
  json.url quote_url(quote, format: :json)
end
