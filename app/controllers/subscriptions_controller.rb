class SubscriptionsController < ApplicationController
#  protect_from_forgery :except => :webhooks
#   before_action :authenticate_bulk_user!, except: [:webhooks]

  def new

  end

  # this is for recursive
  def subscription_payment
    begin
        plan = Stripe::Plan.retrieve(params[:stripe_plan_id])

          customer = Stripe::Customer.create(
        :description => "Customer for #{params[:stripeEmail]}",
        :source => params[:stripeToken],
        :email => params[:stripeEmail]
      )
      stripe_subscription = customer.subscriptions.create(:plan => plan.id)

      @subscription = Subscription.find_or_create_by(bulk_user_id: current_bulk_user.id)
      @subscription.update(stripe_customer_id: customer.id, stripe_subscription_id: stripe_subscription.id, is_premium_user: true)
      # flash[:notice] = 'You have successfully got the premium.'
      #   redirect_to root_path
    rescue Stripe::StripeError => e
        flash[:error] = e.message
        redirect_to root_path
    end
    end

  # Method responsbile for handling stripe webhooks
  # reference https://stripe.com/docs/webhooks
  def webhooks
    begin
      event_json = JSON.parse(request.body.read)
      event_object = event_json['data']['object']
      #refer event types here https://stripe.com/docs/api#event_types
      case event_json['type']
        when 'invoice.payment_succeeded'
          handle_success_invoice event_object
        when 'invoice.payment_failed'
          handle_failure_invoice event_object
        when 'charge.failed'
          handle_failure_charge event_object
        when 'customer.subscription.deleted'
        when 'customer.subscription.updated'
      end
    rescue Exception => ex
      render :json => {:status => 422, :error => "Webhook call failed"}
      return
    end
    render :json => {:status => 200}
  end
end
