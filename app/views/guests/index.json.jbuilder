json.array!(@guests) do |guest|
  json.extract! guest, :id, :first_name, :last_name, :email, :phone_number, :company, :subject, :message, :major, :grad_date
  json.url guest_url(guest, format: :json)
end
