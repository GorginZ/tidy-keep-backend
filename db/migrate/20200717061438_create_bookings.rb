# frozen_string_literal: true

class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.bigint :user_id, null: false
      t.date :date_of
      t.boolean :recurring

      t.timestamps
      t.index ['user_id'], name: 'index_bookings_on_user_id'
    end
  end
end
