FactoryBot.define do 
  factory :booking  do 
    user
    address
    date_of {1.week.ago}
    recurring {true}
  end 
end