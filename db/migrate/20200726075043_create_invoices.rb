class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.bigint :user_id
      t.date :sendDate
      t.date :due_by
      t.float :amount
      t.text :description
      t.date :paid_date
      t.bigint :booking_id
      t.string :stripe_payment

      t.index ["user_id"], name: "index_invoices_on_user_id"
      t.index ["booking_id"], name: "index_invoices_on_booking_id"

      t.timestamps
    end
  end
end
