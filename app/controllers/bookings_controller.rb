class BookingsController < ApplicationController
before_action :authenticate_user
before_action :set_booking, only: %i[show update destroy]
  def index
  @booking = Booking.all
  render json: @booking
    # @bookings = current_user.bookings.order(id: 'asc')
    # render json: @bookings
  end

  def show
    render json: @booking
  end

  def create 
    booking = current_user.bookings.create(booking_params)
    if booking.save
      render json: "booking created", status: :created 
     else 
      render json: {errors: booking.errors.full_messages}, status: :unprocessable_entity 
      end
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
    params.require(:booking).permit(:date_of, :recurring, :price, :booking_id, :user_id, :date_of, :address_id, :time_of)
  end 

  def set_booking 
  @booking = Booking.find(params[:id])
  end 


  def set_booking
    @booking = Booking.find(params[:id])
  end
end
