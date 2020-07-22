require 'rails_helper'

RSpec.describe "Addresses", type: :request do
  describe 'GET addresses#index' do 
  before(:example)do
  #Arrange
  user = create(:user)

  token = Knock::AuthToken.new(payload: {sub: user.id}).token

  auth = { 'Authorization': "Bearer #{token}" }

    @first_address = create(:address)
    @last_address = create(:address)

  #Act
  get '/addresses', headers: auth
  @json_response = JSON.parse(response.body)
    end 
  #assertions
  it 'returns http success code' do
    expect(response).to have_http_status(:success)
    end 

  it 'JSON response body contains the expected attributes' do
    expect(@json_response[0]).to include({
      'id' => @first_address.id,
      'street_address' => @first_address.street_address,
      'state' => @first_address.state,  
      'post_code' =>@first_address.post_code
    })
  end
  end
end
