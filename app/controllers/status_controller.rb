class StatusController < ApplicationController
  before_action :authenticate_user
# passes JWT in headers
  def index
    render json: { message: 'logged in' }
  end

  def user
    render json: { user: current_user.email }
  end
end