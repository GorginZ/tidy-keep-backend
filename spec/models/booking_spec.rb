require 'rails_helper'

RSpec.describe Booking, type: :model do 
#  need to check format of date-time for this subject
  subject{
    Booking.new(
      user_id:  1,
      address_id:   1,
      date_of: t.date,
      price: 160
    )
  }
   context 'validations' do 
   it 'is valid with valid attributes' do 
   expect(subject).to be_valid 
   end 
   it 'is not valid without a user_id' do
     subject.user_id = nil
     expect(subject).to_not be_valid 
   end
   it 'is not valid without a address_id' do
     subject.address_id = nil
     expect(subject).to_not be_valid 
   end
   it 'is not valid without a price' do
     subject.price = nil 
     expect(subject).to_not be_valid
     end 
    it 'is not valid without a date' do 
    subject.date_of = nil
    expect(subject).to_not be_valid
   end
  end 
end 
