require 'rails_helper'

RSpec.describe User, type: :model do 
 
  subject{
    User.new(
      first_name: 'firstname',
      last_name: 'lastname',
      email: 's@email.com',
      password: '123456'
    )
  }
   context 'validations' do 
   it 'is valid with valid attributes' do 
   expect(subject).to be_valid 
   end 
   it 'is not valid without a first name' do
     subject.first_name = nil
     expect(subject).to_not be_valid 
   end
   it 'is not valid without a last name' do
     subject.last_name = nil
     expect(subject).to_not be_valid 
   end
   it 'is not valid without a email' do
     subject.email = nil 
     expect(subject).to_not be_valid
     end 
    it 'is not valid without a password' do 
    subject.password = nil
    expect(subject).to_not be_valid
   end
  end 
end 
