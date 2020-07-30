# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :address
  belongs_to :user
  has_many :booking_services
  has_many :services, through: :booking_services
  validates :datetime, presence: true
  validates :price, presence: true
  validates :recurring, presence: true
end
