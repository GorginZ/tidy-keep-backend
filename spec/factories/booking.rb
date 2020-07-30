# frozen_string_literal: true

FactoryBot.define do
  factory :booking do
    user
    address
    datetime { '2020-08-26 06:45:00' }
    recurring { true }
    price { 270 }
    trait :invalid do
      address_id { nil }
    end
  end
end
