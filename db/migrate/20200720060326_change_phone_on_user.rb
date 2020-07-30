# frozen_string_literal: true

class ChangePhoneOnUser < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :phone, :string
  end
end
