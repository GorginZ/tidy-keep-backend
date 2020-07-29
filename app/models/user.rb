class User < ApplicationRecord
  has_many :addresses
  has_many :bookings
  has_many :invoices
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :last_name, presence: true
  validates :phone, presence: true
  validates_length_of :first_name, minimum: 2
  validates_length_of :last_name, minimum: 2
  validates_length_of :phone, minimum: 8, maximum: 10
end
# validations insure a user has filled out all fields appropriately, these validations produce a 422 or 400 which prompts a error message in the front end
