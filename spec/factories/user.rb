FactoryBot.define do 
  factory :user  do 
  sequence :email do |n|
        "testuser#{n}@test.com"
        end
    first_name {'First'}
    last_name {'Last'}
    password { "password123"}
    phone {458764333}
  end 
end 


