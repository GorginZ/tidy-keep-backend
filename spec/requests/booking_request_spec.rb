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
      'address_id' => @first_booking.address_id,
      'recurring' =>  @first_booking.recurring,
      'price' => @first_booking.price,
  

    })
    end
  end
# we can't test thsi until we know what our form will look like but manual testing in postman working
  describe 'POST booking#create' do
  # #Arrange
  #   context 'when the booking is valid' do
  #     before(:example) do 
  #       @first_booking_params = attributes_for(:booking)
  #       post '/bookings', params: { booking: @first_booking_params }, headers: authenticated_header()
  #     end 

  #     it 'returns a http created status' do 
  #       expect(response).to have_http_status(:created)
  #     end

  #     it 'saves the booking to the database' do
  #       expect(Booking.last.price.to eq(@first_booking_params[:price]))
  #     end 
  # end 

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



  describe 'PUT bookings#update' do
    context 'when the params are valid' do 
      before(:example)do
        @booking = create(:booking)
        @updated_booking_date = "Updated Date"
        put "/bookings/#{@booking.id}",params: { booking: {price: @updated_price} }, headers: authenticated_header()
    end

      it 'has a http no content response status' do
        expect(response).to have_http_status(:no_content)
      end

      it 'updates the booking date_of in the database' do
        expect(Booking.find(@booking.id).date_of).to eq(@updated_date_of)
      end
    end   
  context 'when the params are invalid' do
    before(:example) do
      @booking = create(:booking)
      @updated_date_of = "Updated date_of"
        put "/bookings/#{@booking.id}",params: { booking: {date_of: nil} }, headers: authenticated_header()
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

 describe 'DELETE booking#destroy'
  before(:example) do
  booking = create(:booking)
  # booking_id wrong?
  delete "/bookings/#{booking.id}", params: { booking: {booking_id: @booking_params} }, headers: authenticated_header()
  end 
  
  it 'has a http no content response status' do
  expect(response).to have_http_status(:no_content)
  end 

  it 'removes the booking from the database' do 
  expect(Booking.count).to eq(0)
  end 





end