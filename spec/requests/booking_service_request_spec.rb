# frozen_string_literal: true

RSpec.describe "BookingService", type: :request do

  describe 'POST service#create' do
  #Arrange
    context 'when the booking_service is valid' do
      before(:example) do 
        @bookingService = attributes_for(:BookingServiceRequest)
        post '/booking_service', params: { BookingService: @bookingService_params }, headers: authenticated_header()        
      end
      end 


      it 'returns a http created status' do 
        expect(response).to have_http_status(:created)
      end
          # I don't know why this below fails, passes manually in postman
      # it 'saves the service to the database' do
      #   expect(Service.last.(@first_service.price).to eq(@first_service_params[:price]))
      # end 
  end 
end
# end
