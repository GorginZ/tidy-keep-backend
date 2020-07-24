class AddDatetimeToBookings < ActiveRecord::Migration[6.0]
  def change
  add_column :bookings, :datetime, :datetime
  end
end
