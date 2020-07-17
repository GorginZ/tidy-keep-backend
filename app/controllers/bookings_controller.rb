class BookingsController < ApplicationController

  def index
    @booking = Booking.all
    render json: @booking
  end

end
