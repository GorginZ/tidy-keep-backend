FactoryBot.define do
  factory :address do
    user
    street_address { "MyText" }
    state { "MyText" }
    postcode { 1 }
  end
end