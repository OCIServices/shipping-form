json.array!(@shipments) do |shipment|
  json.extract! shipment, :id, :address_type, :company, :address1, :address2, :address3, :zip, :city, :telephone, :sender_name, :sender_email, :sender_phone, :changepoint_code, :delivery, :return_label, :signature, :state, :insurance, :insurance_amount, :country, :email, :contents, :instructions
  json.url shipment_url(shipment, format: :json)
end
