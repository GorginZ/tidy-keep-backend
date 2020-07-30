# frozen_string_literal: true

class AddressesController < ApplicationController
  before_action :authenticate_user
  before_action :set_address, only: %i[show update destroy]
  def index
    @address = current_user.addresses.order(id: 'asc')
    render json: @address
  end

  def show
    render json: @address
  end

  # address or addresses
  def create
    address = current_user.addresses.create(address_params)
    if address.save
      render json: 'address added', status: :created
    else
      render json: { errors: address.errors.full_messages }, status: :unprocessable_entity
      end
  end

  def update
    address = Address.find(params[:id])
    if address.update(address_params)
      render json: {}, status: :no_content
    else
      render json: { errors: address.errors.full_messages }, status: :unprocessable_entity
    end
    # @address.update(address_params)
    # render json: "address was updated", status: 200
  end

  def destroy
    address = Address.find(params[:id])
    address.delete
    render json: {}, status: :no_content
    # @address.destroy
    # render json: "address was deleted", status: 200
  end

  private

  def address_params
    params.require(:address).permit(:street_address, :state, :post_code, :user_id)
  end

  def set_address
    @address = Address.find(params[:id])
  end
end
