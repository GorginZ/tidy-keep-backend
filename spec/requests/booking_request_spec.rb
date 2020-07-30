# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Bookings", type: :request do
  describe 'GET Bookings#index' do 
  before(:example)do
  #Arrange
    @user = user_with_booking
    @first_booking = @user.bookings.first
    @last_booking = @user.bookings.last
    # @address = create(:address)

  #Act
    get '/bookings', headers: authenticated_user(@user)
    @json_response = JSON.parse(response.body)
  end 
  #assertions
  it 'returns http success code' do
    expect(response).to have_http_status(:success)
    end 

  it 'JSON response body contains the expected attributes' do
    expect(@json_response['bookings'][0]).to include({
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
        post '/bookings', params: { booking: @booking_params }, headers: authenticated_header
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
      before(:example) do
        @booking = create(:booking)
        @updated_booking_price = 200
        put "/bookings/#{@booking.id}", params: { booking: { price: @updated_booking_price } }, headers: authenticated_header
      end

      it 'has a http no content response status' do
        expect(response).to have_http_status(:no_content)
      end

      it 'updates the booking price in the database' do
        expect(Booking.find(@booking.id).price).to eq(@updated_booking_price)
      end
    end
    context 'when the params are invalid' do
      before(:example) do
        @booking = create(:booking)
        @updated_price = 'Updated price'
        put "/bookings/#{@booking.id}", params: { booking: { price: nil } }, headers: authenticated_header
        @json_response = JSON.parse(response.body)
      end
      it 'returns an unprocessable entity response ' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
      it 'has the correct number of errors' do
        expect(@json_response['errors'].count).to eq(1)
      end
    end
  end

  describe 'DELETE booking#destroy'
  before(:example) do
    booking = create(:booking)
    # booking_id wrong?
    delete "/bookings/#{booking.id}", params: { booking: { id: @booking_params } }, headers: authenticated_header
  end

  it 'has a http no content response status' do
    expect(response).to have_http_status(:no_content)
  end

  it 'removes the booking from the database' do
    expect(Booking.count).to eq(0)
  end
end
