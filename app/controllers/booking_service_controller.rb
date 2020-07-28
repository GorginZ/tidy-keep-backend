class BookingServiceController < ApplicationController

 def create
    i = 0
    # Inside this loop we will create a booking service for each booking that was created.
    loop do

      bookingService = BookingService.create(
        booking_id: params[:bookingservice][:booking_id],
        service_id: params[:bookingservice][:serviceArray][i],
        quantity: params[:bookingservice][:quantityArray][i]
      )

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
       i += 1

      if i >= params[:bookingservice][:serviceArray].length
        break
      end
  end

  
    
    render json: "BookingService added", status: 200
  end

private


  def bookingservice_params
    params.require(:bookingservice).permit(:service_id, :booking_id, :quantity)
  end
end
