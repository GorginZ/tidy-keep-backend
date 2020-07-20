class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.bigint :user_id, null: false
      t.text :street_address
      t.text :state
      t.integer :post_code

      t.timestamps
      t.index ["user_id"], name: "index_addresses_on_user_id"

    end
  end
end
