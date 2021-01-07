class SessionsController < ApplicationController
  skip_before_action :require_login, only: :create

  def create
    user = User.valid_login?(params[:email].downcase, params[:password])
    if user
      user.regenerate_token
      render json: user
    else
      render_unauthorized("Incorrect email o password")
    end
  end

  def destroy
    current_user.invalidate_token
    head :ok
  end
end
