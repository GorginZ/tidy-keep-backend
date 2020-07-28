class BookingsController < ApplicationController
require 'active_support/core_ext'
before_action :authenticate_user
before_action :set_booking, only: %i[show update destroy]
  def index
  
    @bookings = current_user.bookings.order(id: 'asc')

    bookings_data = @bookings.map do |booking|
      booking_hash = booking.attributes 
      p booking_hash
      booking_hash[:address] = {street_address: booking.address.street_address, post_code: booking.address.post_code, state: booking.address.state}
       booking_hash
    end
    render json: {bookings: bookings_data}
  end

  def show
    render json: @booking
  end

  def create 
    booking = current_user.bookings.create(booking_params)
    if booking.save && booking.recurring
          current_user.bookings.create(
            price: booking.price,
            user_id: booking.user_id,
            datetime: booking.datetime + 1.weeks,
            address_id: booking.address_id,
            recurring: true
          )
           current_user.bookings.create(
            price: booking.price,
            user_id: booking.user_id,
            datetime: booking.datetime + 2.weeks,
            address_id: booking.address_id,
            recurring: true
          )
         current_user.bookings.create(
            price: booking.price,
            user_id: booking.user_id,
            datetime: booking.datetime + 3.weeks,
            address_id: booking.address_id,
            recurring: true
          )
          current_user.bookings.create(
            price: booking.price,
            user_id: booking.user_id,
            datetime: booking.datetime + 4.weeks,
            address_id: booking.address_id,
            recurring: true
          )
      
      render json: "booking created", status: :created 
    end

    #  else 
    #   render json: {errors: booking.errors.full_messages}, status: :unprocessable_entity 
    #   end
      end

  def update 
 @booking.update(booking_params)
     if @booking.update(booking_params)
        render json: "booking was updated", status: :no_content
    else  
    render json: {errors: @booking.errors.full_messages}, status: :unprocessable_entity 
    end 
  end 

  def destroy
    @booking.destroy
    render json: "booking was deleted", status: :no_content
  end 

  private

  def booking_params 
    params.require(:booking).permit(:recurring, :price, :booking_id, :user_id, :datetime, :address_id)
  end 

  def set_booking 
  @booking = Booking.find(params[:id])
  end 


  def set_booking
    @booking = Booking.find(params[:id])
  end
end
