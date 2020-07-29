class PaymentsController < ApplicationController

  def get_stripe_id
    @booking = Booking.find(params[:id])
   
    session_id = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
        name: " ",
        description: "TidyKeep",
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
      success_url: "https://tidykeep.netlify.app/ViewBookings",
      cancel_url: "https://tidykeep.netlify.app/ViewBookings"
    ).id
    render :json => { id: session_id, stripe_public_key: Rails.application.credentials.dig(:stripe, :public_key) }
    end

  def success
  render json: "paid", status: 200

  end

end