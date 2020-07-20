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
  end 
end 



