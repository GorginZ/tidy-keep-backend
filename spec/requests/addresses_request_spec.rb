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

  context 'when the address is invalid' do
    before(:example) do
      @address_params = attributes_for(:address, :invalid)
      post '/addresses', params: { address: @address_params }, headers: authenticated_header()
      @json_response = JSON.parse(response.body) 
    end
    it 'returns status unprocessable entity' do
      expect(response).to have_http_status(:unprocessable_entity)
    end
    it 'returns the correct number of errors' do
      expect(@json_response['errors'].count).to eq(1)
    end
    it 'errors contain the correct message'do
      expect(@json_response['errors'][0]).to eq("Street address can't be blank")
    end
  end  
 end

  describe 'PUT addresses#update' do
    context 'when the params are valid' do 
      before(:example)do
        @address = create(:address)
        @updated_street_address = "Updated Address"
        put "/addresses/#{@address.id}",params: { address: {street_address: @updated_street_address} }, headers: authenticated_header()
    end

      it 'has a http no content response status' do
        expect(response).to have_http_status(:no_content)
      end

      it 'updates the address in the database' do
        expect(Address.find(@address.id).street_address).to eq(@updated_street_address)
      end
    end   
  context 'when the params are invalid' do
    before(:example) do
      @address = create(:address)
      @updated_street_address = "Updated Address"
        put "/addresses/#{@address.id}",params: { address: {street_address: nil} }, headers: authenticated_header()
      @json_response = JSON.parse(response.body)
    end
    it 'returns an unprocessable entity response ' do 
    expect(response).to have_http_status(:unprocessable_entity)
  end
    it 'has the correct number of errors'do
      expect(@json_response['errors'].count).to eq(1)
    end
  end
 end

 describe 'DELETE addresses#destroy'
  before(:example) do
  address = create(:address)
  delete "/addresses/#{address.id}", params: { address: {street_address: @address_params} }, headers: authenticated_header()
  end 
  
  it 'has a http no content response status' do
  expect(response).to have_http_status(:no_content)
  end 

  it 'removes the address from the database' do 
  expect(Address.count).to eq(0)
  end 
end
