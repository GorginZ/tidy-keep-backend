# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_726_075_043) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'addresses', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.text 'street_address'
    t.text 'state'
    t.integer 'post_code'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_addresses_on_user_id'
  end

  create_table 'booking_services', force: :cascade do |t|
    t.bigint 'service_id', null: false
    t.bigint 'booking_id', null: false
    t.integer 'quantity'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['booking_id'], name: 'index_bookings_services_on_booking_id'
    t.index ['service_id'], name: 'index_bookings_services_on_service_id'
  end

  create_table 'bookings', force: :cascade do |t|
    t.boolean 'recurring'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'address_id', null: false
    t.integer 'price'
    t.bigint 'user_id', null: false
    t.datetime 'datetime'
    t.index ['address_id'], name: 'index_bookings_on_address_id'
    t.index ['user_id'], name: 'index_bookings_on_user_id'
  end

  create_table 'invoices', force: :cascade do |t|
    t.bigint 'user_id'
    t.date 'sendDate'
    t.date 'due_by'
    t.float 'amount'
    t.text 'description'
    t.date 'paid_date'
    t.bigint 'booking_id'
    t.string 'stripe_payment'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['booking_id'], name: 'index_invoices_on_booking_id'
    t.index ['user_id'], name: 'index_invoices_on_user_id'
  end

  create_table 'services', force: :cascade do |t|
    t.string 'title'
    t.integer 'price'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email'
    t.string 'password_digest'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'first_name'
    t.string 'last_name'
    t.string 'phone'
  end
end
