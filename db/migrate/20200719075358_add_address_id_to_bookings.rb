# frozen_string_literal: true

class AddAddressIdToBookings < ActiveRecord::Migration[6.0]
  def change
    change_table :bookings do |t|
      t.bigint :address_id, null: false
      t.index ['address_id'], name: 'index_bookings_on_address_id'
    end
  end
end
