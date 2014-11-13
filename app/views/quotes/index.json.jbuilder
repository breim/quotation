json.array!(@quotes) do |quote|
  json.extract! quote, :id, :name, :description, :prazo_de_resposta, :user_id
  json.url quote_url(quote, format: :json)
end
