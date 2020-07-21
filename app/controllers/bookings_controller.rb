class BookingsController < ApplicationController

  def index
    @booking = Booking.all
    render json: @booking
  end

  def show 
    render json @booking
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
    params.require(:booking).permit(:title, :price)
  end 

  def set_booking 
 @booking = Booking.find(params[:id])
  end 


end
