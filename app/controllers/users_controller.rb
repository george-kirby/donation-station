class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit, :update]


  def new
    @user = User.new
  end

  def home
  end

  def show
  end

  def create
    @user = User.create(user_params)
    flash[:notices] = ["Account created!"]
    redirect_to login_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :phone_number, :email)
  end
end
