FactoryBot.define do 
  factory :user  do 
    first_name {'Factory Test User First'}
    last_name {'Factory Test User Last'}
    email {'s@gmail.com'}
    password {123456}
  end 
end 
