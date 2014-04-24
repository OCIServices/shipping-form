class ShippingPdfForm < FillablePdfForm

  def initialize(shipping_form)
    @shipping_form = shipping_form
    super()
  end

  protected

  def tf(value)
    if (value == true)
      return "Yes"
    else
      return "No"
    end
  end

  def fill_out
    ["Address" => "address_type",
      "Company" => "company",
      "Attention" => "attention",
      "Address 1" => "address1",
      "Address 2" => "address2",
      "Address 3" => "address3",
      "Zip Code" => "zip",
      "City" => "city",
      "States" => "state",
      "Country" => "country",
      "Telephone" => "telephone",
      "Email" => "email",
      "Sender Name" => "sender_name",
      "Sender Email" => "sender_email",
      "Sender Phone" => "sender_phone",
      "Changepoint Code" => "changepoint_code",
      "Date/time" => "delivery",
#      "List address in special instructionsSignature required" => "",
      "Specify" => "delivery_specifics",
      "Amount" => "insurance_amount",
      "Please list Shipment Contents" => "contents",
      "Please list special instructions" => "instructions"
    ].each do |fields|
      fields.each do |key, value|
        fill key, @shipping_form.send(value)  
      end
    end
    
    ["Return Label" => "return_label",
      "Signature" => "signature",
      "Insurance" => "insurance"
    ].each do |fields|
      fields.each do |key, value|
        fill key, tf(@shipping_form.send(value))
      end
    end
  end
end