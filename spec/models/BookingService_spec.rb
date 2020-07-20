require 'rails_helper'

RSpec.describe BookingService, type: :model do
  subject {build(:BookingService)}

   context 'validations' do 
    it 'is valid with valid attributes' do 
    expect(subject).to be_valid 
   end 
   it 'is not valid without a quantity' do
     subject.quantity = nil
     expect(subject).to_not be_valid 
   end
  end 
end 
