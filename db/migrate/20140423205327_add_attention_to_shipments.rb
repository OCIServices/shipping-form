class AddAttentionToShipments < ActiveRecord::Migration
  def change
    add_column :shipments, :attention, :string
  end
end
