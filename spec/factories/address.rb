FactoryBot.define do
  factory :address do
    user
    street_address { |n| "MyText no.#{n}" }
    state { "MyText" }
    post_code { 1 }
  end
end
