class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :name

      t.timestamps
    end
  end
end
