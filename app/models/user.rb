class User < ApplicationRecord

  has_many :addresses
  has_many :bookings

  has_secure_password
   validates :email, presence: true
  #  only one acc
   validates :email, uniqueness: true
   validates :first_name, presence: true 
   validates :last_name, presence: true
end
