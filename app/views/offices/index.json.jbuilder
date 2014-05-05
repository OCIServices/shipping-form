json.array!(@offices) do |office|
  json.extract! office, :id, :address1, :address2, :address3, :city, :state, :zip, :country, :name
  json.url office_url(office, format: :json)
end
