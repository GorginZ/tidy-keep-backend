# frozen_string_literal: true

class AddUserToBookings < ActiveRecord::Migration[6.0]
  def change
    change_table :bookings do |t|
      t.bigint :user_id, null: false
      t.index ['user_id'], name: 'index_bookings_on_user_id'
    end
end
end
