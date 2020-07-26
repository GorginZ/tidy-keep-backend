FactoryBot.define do
  factory :invoice do
    user_id { "" }
    sendDate { "2020-07-26" }
    due_by { "2020-07-26" }
    amount { 1.5 }
    description { "MyText" }
    paid_date { "2020-07-26" }
    booking_id { "" }
  end
end
