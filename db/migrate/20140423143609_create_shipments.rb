class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.string :address_type
      t.string :company
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :zip
      t.string :city
      t.string :telephone
      t.string :sender_name
      t.string :sender_email
      t.string :sender_phone
      t.string :changepoint_code
      t.string :delivery
      t.boolean :return_label
      t.boolean :signature
      t.string :state
      t.boolean :insurance
      t.string :insurance_amount
      t.string :country
      t.string :email
      t.text :contents
      t.text :instructions

      t.timestamps
    end
  end
end
