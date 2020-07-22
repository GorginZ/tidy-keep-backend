require 'rails_helper'

RSpec.describe "Bookings", type: :request do
  describe 'GET bookings#index' do 
  before(:example)do
  #Arrange
  user = create(:user)

  token = Knock::AuthToken.new(payload: {sub: user.id}).token

  auth = { 'Authorization': "Bearer #{token}" }

    @first_address = create(:address)
    @last_address = create(:address)
    @booking = create(:booking)

  #Act
  get '/bookings', headers: auth
  @json_response = JSON.parse(response.body)
    end 
  #assertions
  it 'returns http success code' do
    expect(response).to have_http_status(:success)
    end 

  it 'JSON response body contains the expected attributes' do
    expect(@json_response[0]).to include({
      'address_id' => @address.id,
      'date_of'=> @booking.date_of,
      'price' => @booking.price,
      'recurring' => @booking.recurring
    })
  end
  end
end