require 'rails_helper'

RSpec.describe "Bookings", type: :request do
  describe 'GET Bookings#index' do 
  before(:example)do
  #Arrange
    @first_booking = create(:booking)
    @last_booking = create(:booking)
    # @address = create(:address)

  #Act
    get '/bookings', headers: authenticated_header()
    @json_response = JSON.parse(response.body)
  end 
  #assertions
  it 'returns http success code' do
    expect(response).to have_http_status(:success)
    end 

  it 'JSON response body contains the expected attributes' do
    expect(@json_response[0]).to include({
      'user_id' => @booking.user_id,
      'date_of' => @booking.date_of,
      'address_id' => @booking.address_id,
      'recurring' =>  @booking.recurring,
      'price' => @booking.price,

    })
    end
  end

  describe 'POST booking#create' do
  # #Arrange
    context 'when the booking is valid' do
      before(:example) do 
        @booking_params = attributes_for(:booking)
        post '/bookings', params: { booking: @booking_params }, headers: authenticated_header()
      end 

      it 'returns a http created status' do 
        expect(response).to have_http_status(:created)
      end

      it 'saves the booking to the database' do
        expect(Booking.last.user_id.to eq(@booking_params[:user_id]))
      end 
  end 

  context 'when the booking is invalid' do
    before(:example) do
      @booking_params = attributes_for(:booking, :invalid)
      post '/bookings', params: { booking: @booking_params }, headers: authenticated_header()
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
end