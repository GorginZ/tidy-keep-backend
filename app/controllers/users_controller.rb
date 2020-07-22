class UsersController < ApplicationController
  # before_action :authenticate_user, only: [:update]
  def create
    user = User.new(user_params)
    if user.save
      render json: "user created", status: :created
    # below for errors
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :phone)
  end
end
