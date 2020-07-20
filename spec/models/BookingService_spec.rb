require 'rails_helper'

RSpec.describe BookingService, type: :model do
  subject {build(:BookingService)}

   context 'validations' do 
    it 'has a valid factory' do 
    expect(build(:BookingService)).to be_valid 
   end 

    it { expect(subject).to validate_presence_of (:quantity)}

  end 
  context "associations" do 
  it {expect(subject).to belong_to(:service)}
  it {expect(subject).to belong_to(:booking)}
  end
end 

