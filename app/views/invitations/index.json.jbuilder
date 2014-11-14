json.array!(@invitations) do |invitation|
  json.extract! invitation, :id, :quote_id, :company_id, :user_id
  json.url invitation_url(invitation, format: :json)
end
