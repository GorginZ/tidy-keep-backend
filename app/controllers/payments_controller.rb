class PaymentsController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: [:webhook]

# looking into creating invoice different to making one off charges
# will return to this after booking flow is finalized. 
require 'stripe'
def new
		@invoice = Invoice.find(params[:invoice_id])
	end
              # :invoice_amt or :invoice_amount
	def create
	  Stripe.api_key = "sk_test_jKDPCGRhB53sQ2dYEa2N3iuB"
	  @invoice_amount = params[:invoice_amount]
	  @amount = params[:invoice_amount].to_i * 100

	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'aud'
	  )
		@invoice = Invoice.find(params[:invoice_id])
		if @invoice.update(stripe_payment: params[:stripeToken], paid_date: Time.now.strftime("%Y-%m-%d"))
            render json: "invoice paid", status: :no_content
        else 
              render json: {errors: @invoice.errors.full_messages}

      	end
		rescue Stripe::CardError => e
		  render json: {errors: @invoice.errors_fullmessages}
		end
end