require 'rails_helper'

RSpec.describe Address, type: :model do 

  subject{
    Address.new(
      street_address:  "120 Spencer Street",
      state:   "Vic",
      post_code: 3003
    )
  }
   context 'validations' do 
   it 'is valid with valid attributes' do 
   expect(subject).to be_valid 
   end 
   it 'is not valid without a street_address' do
     subject.street_address = nil
     expect(subject).to_not be_valid 
   end
   it 'is not valid without a state' do
     subject.state = nil
     expect(subject).to_not be_valid 
   end
   it 'is not valid without a post_code' do
     subject.post_code = nil 
     expect(subject).to_not be_valid
     end 
   
  end 
end 
