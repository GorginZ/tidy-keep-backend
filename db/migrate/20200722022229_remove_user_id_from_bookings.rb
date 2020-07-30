# frozen_string_literal: true

class RemoveUserIdFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_index :bookings, column: :user_id
    remove_column :bookings, :user_id
  end
end
