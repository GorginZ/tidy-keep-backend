class Address < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :street_address, presence: true
  validates :state, presence: true
  validates :post_code, presence: true
end
