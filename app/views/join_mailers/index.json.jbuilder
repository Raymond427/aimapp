json.array!(@join_mailers) do |join_mailer|
  json.extract! join_mailer, :id, :first_name, :last_name, :email, :phone_number, :major, :grad_date, :message
  json.url join_mailer_url(join_mailer, format: :json)
end
