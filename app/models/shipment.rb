class Shipment < ActiveRecord::Base

  validates :address_type, :attention, :address1, :zip, :city, :sender_name, :sender_email, :sender_phone, :delivery, :state, :country, :contents, presence: true

  validates :address_type, format: { with: %r{(Residential|Commercial)\Z}i,
    message: 'The Address Type must be a "Residential" or "Commercial"'
  }

  validates :zip, format: { with: %r{\d{5}\Z}i,
    message: 'The Zip Code must be a 5-digit number'
  }

  validates :delivery, format: { with: %r{(I will specify|No Rush)\Z}i,
    message: 'You must specify a valid delivery timeline'
  }
  
  #validates :delivery_specifics, presence: true
  validates :delivery_specifics, presence: {if: :delivery_is_specified?, message: 'If you want to specify a delivery date, you must provide specifics!'}

  validates :state, :inclusion => { :in => STATES.values.map(&:to_s),
    message: 'You must select a valid state'
  }

  validates :insurance_amount, presence: {if: :insurance_is_requested?, message: 'If you want to have insurance, you must an amount!'}, numericality: { greater_than_or_equal_to: 0, allow_blank: true }

  validates :instructions, presence: {if: :return_label_is_specified?, message: 'If you want a return label, you must provide specifics in the "special instructions" field!'}

  def delivery_is_specified?
    delivery == "I will specify"
  end

  def insurance_is_requested?
    insurance == true
  end

  def return_label_is_specified?
    return_label == true
  end

end
