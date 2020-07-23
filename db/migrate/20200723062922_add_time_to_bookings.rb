class AddTimeToBookings < ActiveRecord::Migration[6.0]
  def change
  add_column :bookings, :time_of, :time 
  end
end


