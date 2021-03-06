class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: user.to_json, status: 200
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
