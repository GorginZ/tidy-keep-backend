require 'rails_helper'

RSpec.describe Address, type: :model do
  subject {build(:address)}

   context 'validations' do 
   it 'is valid with valid attributes' do 
   expect(subject).to be_valid 
   end 
   it 'is not valid without a street' do
     subject.street_address = nil
     expect(subject).to_not be_valid 
   end
      it 'is not valid without a state' do
     subject.state = nil
     expect(subject).to_not be_valid 
   end
      it 'is not valid without a postcode' do
     subject.post_code = nil
     expect(subject).to_not be_valid 
   end

  end 
end 

