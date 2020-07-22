class BookingsController < ApplicationController
before_action :authenticate_user
before_action :set_booking, only: %i[show update destroy]
  def index
    @bookings = current_user.bookings.order(address_id: 'asc')
    render json: @bookings
  end

  def show 
    render json: @booking
  end 

  def create 
    booking = current_user.bookings.create(booking_params)
    if booking.save
      render json: "booking created", status: 200 
     else 
      render json: "booking was not saved", status: 422
      end
      end

  def update 
 @booking.update(booking_params)
    render json: "booking was updated", status: 200
  end 

  def destroy
 @booking.destroy
    render json: "booking was deleted", status: 200
  end 

  private 

  def booking_params 
    params.require(:booking).permit(:date_of, :recurring, :price, :address_id, :user_id, :date_of)
  end 

  def set_booking 
  @booking = Booking.find(params[:id])
  end 


end

