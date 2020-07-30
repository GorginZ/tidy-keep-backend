# frozen_string_literal: true

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
     

      i += 1
      break if i >= params[:bookingservice][:serviceArray].length
    end

    render json: 'BookingService added', status: 200
   end

  private

  def bookingservice_params
    params.require(:bookingservice).permit(:service_id, :booking_id, :quantity)
  end
end
