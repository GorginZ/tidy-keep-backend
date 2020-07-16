class ServicesController < ApplicationController
def index
    @services = Service.all
  end
 
  def index 
    @services = Service.all.order(id: "desc")
    render json: @services
  end 

  def show 
    render json: @service
  end 

  def create 
    Bookmark.create(service_params)
    render json: "service added", status: 200 
  end 

  def update 
    @service.update(service_params)
    render json: "service was updated", status: 200
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
