require 'rails_helper'

RSpec.describe User, type: :model do 
 
  subject{
    User.new{
      name: 'name',
      
    }
  }
   context 'validations' do 
  end 
end 