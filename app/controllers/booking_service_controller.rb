class BookingServiceController < ApplicationController

 def create
    BookingService.create(bookingservice_params)
    render json: "BookingService added", status: 200
  end

private


  def bookingservice_params
    params.require(:bookingservice).permit(:service_id, :booking_id, :quantity)
  end
end
