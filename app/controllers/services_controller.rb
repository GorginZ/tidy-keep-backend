# frozen_string_literal: true

class ServicesController < ApplicationController
  def index
    @services = Service.all.order(id: 'desc')
    render json: @services
  end

  def show
    render json: @service
  end

  def create
    @service = Service.create(service_params)
    if @service.save
      render json: 'service created', status: :created
    else
      render json: { errors: @service.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    service = Service.find(params[:id])
    if service.update(service_params)
      render json: {}, status: :no_content
    else
      render json: { errors: service.errors.full_messages }, status: :unprocessable_entity
    end
   end

  def destroy
    service = Service.find(params[:id])
    service.delete
    render json: {}, status: :no_content
end

  private

  def service_params
    params.require(:service).permit(:title, :price)
  end

  def set_service
    @service = Service.find(params[:id])
  end
end
