 FactoryBot.define do 
  factory :BookingService do 
    booking
    service
    quantity {1}
  end 
end 

FactoryBot.define do
  factory :BookingServiceRequest do
    booking_id {[26]}
    quantity {["4", "4", 1, 1]}
    service_id {[1, 2, 8, 1]}
  end
end


 
 