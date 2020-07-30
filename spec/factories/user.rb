FactoryBot.define do 
  factory :user  do 
  sequence :email do |n|
        "testuser#{n}@test.com"
        end
    first_name {'First'}
    last_name {'Last'}
    password { "password123"}
    phone {'0432989648'}
  end 
end 

def user_with_booking
  FactoryBot.create(:user) do |user|
    FactoryBot.create_list(:booking,2, user: user)
  end
end

def user_with_address
  FactoryBot.create(:user) do |user|
    FactoryBot.create_list(:address,2, user: user)
  end
end


