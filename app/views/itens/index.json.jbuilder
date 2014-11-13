json.array!(@itens) do |iten|
  json.extract! iten, :id, :name, :amount, :part_number, :quote_id
  json.url iten_url(iten, format: :json)
end
