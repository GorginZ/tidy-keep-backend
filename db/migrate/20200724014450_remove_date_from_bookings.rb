# frozen_string_literal: true

class RemoveDateFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :date_of
    remove_column :bookings, :time_of
  end
end
