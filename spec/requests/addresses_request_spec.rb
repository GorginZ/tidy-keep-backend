require 'rails_helper'

RSpec.describe "Addresses", type: :request do
  describe 'GET addresses#index' do 
  before(:example)do
  #Arrange
    
    @first_address = create(:address)
    @last_address = create(:address)

  #Act
    get '/addresses', headers: authenticated_header()
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

  describe 'POST addresses#create' do
  # #Arrange
    context 'when the address is valid' do
      before(:example) do 
        @address_params = attributes_for(:address)
        post '/addresses', params: { address: @address_params }, headers: authenticated_header()
      end 

      it 'returns a http created status' do 
        expect(response).to have_http_status(:created)
      end

      it 'saves the address to the database' do
        expect(Address.last.street_address).to eq(@address_params[:street_address])
      end 
    end
  end
end
