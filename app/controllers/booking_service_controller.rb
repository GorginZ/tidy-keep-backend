class BookingServiceController < ApplicationController

 def create
    bookingService = BookingService.create(bookingservice_params)
    if bookingService.save
      BookingService.create(
        service_id: bookingService.service_id,
        booking_id: bookingService.booking_id - 1,
        quantity: bookingService.quantity
      )
      BookingService.create(
        service_id: bookingService.service_id,
        booking_id: bookingService.booking_id - 2,
        quantity: bookingService.quantity
      )
      BookingService.create(
        service_id: bookingService.service_id,
        booking_id: bookingService.booking_id - 3,
        quantity: bookingService.quantity
      )
      BookingService.create(
        service_id: bookingService.service_id,
        booking_id: bookingService.booking_id - 4,
        quantity: bookingService.quantity
      )

    end
    render json: "BookingService added", status: 200
  end

private


  def bookingservice_params
    params.require(:bookingservice).permit(:service_id, :booking_id, :quantity)
  end
end
