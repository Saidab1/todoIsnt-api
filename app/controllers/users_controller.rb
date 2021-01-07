class UsersController < ApplicationController
  skip_before_action :require_login, only: [:index, :create]

  # GET /users
  def index
    @users = current_user

    render json: current_user
  end

  # GET /users/1
  def show
    render json: current_user
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.email.downcase!

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if current_user.update(user_params)
      render json: current_user
    else
      render json: current_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_user
  # @user = User.find(params[:id])
  # end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end
end
