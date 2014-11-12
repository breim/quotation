json.array!(@funcionaries) do |funcionary|
  json.extract! funcionary, :id, :company_id, :user_id
  json.url funcionary_url(funcionary, format: :json)
end
