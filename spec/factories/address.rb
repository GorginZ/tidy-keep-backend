FactoryBot.define do
  factory :address do
    user
    street_address { "MyText" }
    state { "MyText" }
    post_code { 1 }
  end
end
