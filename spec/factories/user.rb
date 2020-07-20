FactoryBot.define do 
  factory :user  do 
    first_name {'Factory Test User First'}
    last_name {'Factory Test User Last'}
    sequence :email do |n|
      "#{n}s@gmail.com"
    end 
    password {'123456'}
  end 
end 
