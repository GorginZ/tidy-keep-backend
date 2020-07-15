class UsersController < ApplicationController
  def create
   user = User.new(user_params)
    if user.save
      render json: "user created", status: 200
    # below for errors
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  private 

  def user_params 
    params.require(:user).permit(:email, :password)
  end 
end

