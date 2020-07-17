require 'rails_helper'

RSpec.describe Service, type: :model do 
 
  subject{
    Service.new(
      title: "two_bedroom",
      price: 150
    )
  }
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
