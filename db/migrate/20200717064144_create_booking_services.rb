# frozen_string_literal: true

class CreateBookingServices < ActiveRecord::Migration[6.0]
  def change
    create_table :booking_services do |t|
      t.bigint :service_id, null: false
      t.bigint :booking_id, null: false
      t.integer :quantity

      t.timestamps

      t.index ['service_id'], name: 'index_bookings_services_on_service_id'
      t.index ['booking_id'], name: 'index_bookings_services_on_booking_id'
    end
  end
end
