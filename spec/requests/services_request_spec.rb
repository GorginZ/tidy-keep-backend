require 'rails_helper'

RSpec.describe "Services", type: :request do
  describe 'GET Services#index' do 
  before(:example)do
  #Arrange
    @first_service = create(:service)
    # @last_service = create(:service)

  #Act
    get '/services', headers: authenticated_header()
    @json_response = JSON.parse(response.body)
  end 
  #assertions
  it 'returns http success code' do
    expect(response).to have_http_status(:success)
    end 

  it 'JSON response body contains the expected attributes' do
    expect(@json_response[0]).to include({
      'title' => @first_service.title,
      'price' =>  @first_service.price
    })
    end
  end

  describe 'POST service#create' do
  #Arrange
    context 'when the service is valid' do
      before(:example) do 
        @first_service_params = attributes_for(:service)
        post '/services', params: { service: @first_service_params }, headers: authenticated_header()
      end 

      it 'returns a http created status' do 
        expect(response).to have_http_status(:created)
      end

      it 'saves the service to the database' do
        expect(Service.last.title.to eq(@first_service_params[:title]))
      end 
  end 

  context 'when the service is invalid' do
    before(:example) do
      @service_params = attributes_for(:service, :invalid)
      post '/services', params: { service: @service_params }, headers: authenticated_header()
      @json_response = JSON.parse(response.body) 
    end
    it 'returns status unprocessable entity' do
      expect(response).to have_http_status(:unprocessable_entity)
    end
    it 'returns the correct number of errors' do
      expect(@json_response['errors'].count).to eq(1)
    end
  end  
 end
  describe 'PUT services#update' do
    context 'when the params are valid' do 
      before(:example)do
        @service = create(:service)
        @updated_service_price = 200
        put "/services/#{@service.id}",params: { service: {price: @updated_service_price} }, headers: authenticated_header()
    end

      it 'has a http no content response status' do
        expect(response).to have_http_status(:no_content)
      end

      it 'updates the service price in the database' do
        expect(Service.find(@service.id).price).to eq(@updated_service_price)
      end
    end   
  context 'when the params are invalid' do
    before(:example) do
      @service = create(:service)
      @updated_price = "Updated price"
        put "/services/#{@service.id}",params: { service: {price: nil} }, headers: authenticated_header()
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

#  describe 'DELETE service#destroy'
#   before(:example) do
#   service = create(:service)
#   delete "/services/#{service.id}", params: { service: {id: @service_params} }, headers: authenticated_header()
#   end 
  
#   it 'has a http no content response status' do
#   expect(response).to have_http_status(:no_content)
#   end 

#   it 'removes the service from the database' do 
#   expect(service.count).to eq(0)
#   end 
end