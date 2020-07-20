require 'rails_helper'

RSpec.describe Service, type: :model do 
subject {build(:service)}
   context 'validations' do 
   it 'is valid with valid attributes' do 
   expect(subject).to be_valid 
   end 
   it 'is not valid without a title' do
     subject.title = nil
     expect(subject).to_not be_valid 
   end
   it 'is not valid without a price' do
     subject.price = nil
     expect(subject).to_not be_valid 
   end
  end 
end 
