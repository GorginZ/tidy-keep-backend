require 'rails_helper'

RSpec.describe Booking, type: :model do 
subject {build(:booking)}
   context 'validations' do 
   it 'has a valid factory' do 
   expect(build(:booking)).to be_valid
   end 

    it 'is not valid without a date' do 
    subject.date_of = nil
    expect(subject).to_not be_valid
   end
    
    it 'is not valid without a price' do 
    subject.price = nil
    expect(subject).to_not be_valid
   end
   it 'is not valid without a recurring' do 
    subject.recurring = nil
    expect(subject).to_not be_valid
   end

  context "associations" do 
  it {expect(subject).to belong_to(:address)}
  it {expect(subject).to have_many(:booking_services)}
  it {expect(subject).to have_many(:services).through(:booking_services)}
  end
  end 
end 



