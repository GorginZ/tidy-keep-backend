# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    user
    street_address { |n| "MyText no.#{n}" }
    state { 'MyText' }
    post_code { 1 }

    trait :invalid do
      street_address { nil }
    end
  end
end
