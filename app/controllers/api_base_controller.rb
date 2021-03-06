class ApiBaseController < ApplicationController
  def validate_params(required_params, params)
    if required_params.any? { |required_param| !params.fetch(required_param, nil).present? }
      render json: { errors: "You did not include all the mandatory fields" }, status: :unprocessable_entity and return false
    else
      return true
    end
  end

  def validate_users(user_ids)
    if user_ids.any? { |user_id| !User.where(id: user_id).present? }
      render json: { errors: "The recipient/sender you specified does not exist" }, status: :unprocessable_entity and return false
    else
      return true
    end
  end
end
