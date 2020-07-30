# frozen_string_literal: true

class Service < ApplicationRecord
  has_many :booking_services
  has_many :bookings, through: :booking_services
  validates :title, presence: true
  validates :price, presence: true
end
