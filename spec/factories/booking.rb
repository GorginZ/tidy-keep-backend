FactoryBot.define do 
  factory :booking  do 
    address
    date_of {1.week.ago}
    recurring {true}
    price {270}
  end 
end 