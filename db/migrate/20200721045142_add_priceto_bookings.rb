class AddPricetoBookings < ActiveRecord::Migration[6.0]
  def change
  add_column :bookings, :price, :integer
  end
end


