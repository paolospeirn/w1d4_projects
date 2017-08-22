class UsersController < ApplicationController


  def index
    @users = User.all
    render json: @users
  end

  def create
    user = User.new(params[:user].permit(:name, :email))
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update!(user_params)
    render json: @user
  end

  def destroy
    deleted_user = User.find(params[:id])
    deleted_user.destroy
    render json: @users
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
