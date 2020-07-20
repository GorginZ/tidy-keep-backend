require 'rails_helper'

RSpec.describe Booking, type: :model do 
subject {build(:booking)}
   context 'validations' do 
   it 'is valid with valid attributes' do 
   expect(subject).to be_valid 
   end 
    it 'is not valid without a date' do 
    subject.date_of = nil
    expect(subject).to_not be_valid
   end
  end 
end 
