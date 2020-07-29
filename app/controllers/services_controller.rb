class ServicesController < ApplicationController

  def index
    @services = Service.all.order(id: "desc")
    render json: @services
  end

  def show
    render json: @service
  end

  def create
    @service = Service.create(service_params)
    if @service.save
      render json: "service created", status: :created
    else
       render json: {errors: @service.errors.full_messages}, status: :unprocessable_entity
    end
  end


  def update
    @service.update(service_params)
    if @service.update(service_params)
       render json: "updated", status: :no_content
       else
          render json: {errors: @service.errors.full_messages}, status: :unprocessable_entity
   end
  end

  def destroy
    @service.destroy
    render json: "service was deleted", status: 200
  end

  private

  def service_params
    params.require(:service).permit(:title, :price)
  end

  def set_service
    @service = Service.find(params[:id])
  end
end
