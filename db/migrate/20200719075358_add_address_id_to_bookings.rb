class AddAddressIdToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :address_id, :bigint, null: false
​    add_index :bookings, :address_id
  end
end
