class InvoicesController < ApplicationController
  before_action :authenticate_user

  def deleteInvoice
    Invoice.find(params[:id]).destroy
    redirect_to '/invoices'
  end

  def edit
    @invoice = Invoice.find(params[:id])
  end

  def show
    @invoice = Invoice.find(params[:id])
  end


  def create
      invoice = current_user.invoices.create(invoice_params)
    # @invoice = Invoice.new(invoice_params)
    if invoice.save
            render json: "invoice created", status: :created
      # redirect_to "/invoices"
    else
      render json: invoice.errors.full_messages, status: 422
      # redirect_to "/"
    end
  end

  # def update
  # 	# the below updates invoice to be paid via updating stripe_payment(or check_payment) and paid_date
  # 	# Invoice.update(4, :stripe_payment=> "222sd2g34234",:paid_date => Time.now.to_s(:db))
  # 	invoice = Invoice.find(params[:invoice_id])

  # 	if invoice.update(amount: params[:amt], description: params[:description], due_by: params[:due])
  # 		flash[:success] = "Your invoice has been updated"
  # 		# change the redirect_to to be after clients
  # 		redirect_to "/companies"
  # 	else
  # 		flash[:errors] = invoice.errors.full_messages
  # 		redirect_to :back
  # 	end
  # end		

  def destroy
    # session.clear
    # redirect_to :back
  end
  
  private
    def invoice_params
      params.require(:invoice).permit(:user_id, :booking_id, :sendDate, :due_by, :description, :amount, :paid_date, :stripe_payment)
    end
end
