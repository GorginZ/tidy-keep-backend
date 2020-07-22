FactoryBot.define do 
  factory :booking  do 
  user
    address
    date_of {"2020-4-2"}
    recurring {true}
    price {270}
  end 
end 
