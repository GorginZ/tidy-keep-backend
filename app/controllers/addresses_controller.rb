class AddressesController < ApplicationController
  before_action :authenticate_user
  before_action :set_address, only: %i[show update destroy]
  def index
    @address = Address.all
    render json: @address
  end

  def show
    render json: @address
  end

  # address or addresses
  def create
    address = current_user.addresses.create(address_params)
    if address.save
      render json: "address added", status: :created
    else
      render json: "address not saved"
      end
  end

  def update
    @address.update(address_params)
    render json: "address was updated", status: 200
  end

  def destroy
    @address.destroy
    render json: "address was deleted", status: 200
  end

  private

  def address_params
    params.require(:address).permit(:street_address, :state, :post_code, :user_id)
  end

  def set_address
    @address = Address.find(params[:id])
  end
end
