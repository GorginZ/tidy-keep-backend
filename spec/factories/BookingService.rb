# frozen_string_literal: true

FactoryBot.define do
  factory :BookingService do
    booking
    service
    quantity { 1 }
  end
end
