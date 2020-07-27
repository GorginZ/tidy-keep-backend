class PaymentsController < ApplicationController

  def get_stripe_id
    @booking = Booking.find(params[:id])
    # @booking_services = BookingService.where(booking_id: @booking.id)
    # @street_address = Address.street_address.where(address_id: @booking.address_id)

    session_id = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
        name: " ",
        description: "desc",
        amount: @booking.price * 100,
        currency: 'aud',
        quantity: 1
      }],
      payment_intent_data: {
        metadata: {
          user_id: current_user.id,
          booking_id: @booking.id
        }
      },
      success_url: "http://localhost:8080/landing",
      cancel_url: "http://localhost:8080"
    ).id
    render :json => { id: session_id, stripe_public_key: Rails.application.credentials.dig(:stripe, :public_key) }
    end

  def success
  render json: "paid", status: 200

    # redirect_to my_orders_path
  end

  # the webhook action changes the availability attribute of the instance variable 'availability' to 'false' and saves the listing object.
  # def webhook
  #   payment_id = params[:data][:object][:payment_intent]
  #   payment = Stripe::PaymentIntent.retrieve(payment_id)
  #   booking_id = payment.metadata.booking_id
  #   user_id = payment.metadata.user_id

  #   Invoice.create(booking_id: booking_id, user_id: user_id)
  #   invoice = Invoice.find(invoice_id)
  #   invoice.paid_date = Time.now.strftime("%Y-%m-%d")
  #   invoice.save

  #   head 200
  # end

  def failure
  end
end