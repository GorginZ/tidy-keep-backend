class User < ApplicationRecord

  has_many :addresses
  # has_many :bookings


 has_secure_password
   validates :email, presence: true, uniqueness: true


  #  only one acc
   validates :first_name, presence: true 
   validates :last_name, presence: true
   validates :phone, presence: true
end
