class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
    render json: @bookings
  end

  def show 
    render json: @booking
  end 

  def create 
    Booking.create(booking_params)
    render json: "booking added", status: 200 
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
    params.require(:booking).permit(:date_of, :recurring, :price, :address_id, :user_id)
  end 

  def set_booking 
  @booking = Booking.find(params[:id])
  end 


end

