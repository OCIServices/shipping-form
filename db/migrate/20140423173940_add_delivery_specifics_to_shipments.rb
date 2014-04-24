class AddDeliverySpecificsToShipments < ActiveRecord::Migration
  def change
    add_column :shipments, :delivery_specifics, :string
  end
end
