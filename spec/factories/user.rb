# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "testuser#{n}@test.com"
    end
    first_name { 'First' }
    last_name { 'Last' }
    password { 'password123' }
    phone { '0432989648' }
  end
end
