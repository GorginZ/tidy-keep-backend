# frozen_string_literal: true

FactoryBot.define do
  factory :service do
    title { 'my service' }
    price { 123 }
    trait :invalid do
      price { nil }
    end
  end
end
