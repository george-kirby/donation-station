class UsersController < ApplicationController

  before_action :find_user, only: :show


  def new
    @user = User.new
  end

  def home
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notices] = ["Account created! Please log in"]
      redirect_to login_path
    else
      flash[:errors] = ["Login failed", @user.errors.full_messages].flatten
      render :new
    end
  end

  def edit
  end

  def update
    if @current_user.update(user_params)
      flash[:notices] = ["Account updated successfully!"]
      redirect_to user_home_path
    else
      flash[:errors] = ["Account not updated", @current_user.errors.full_messages].flatten
      render :edit
    end
  end

  def destroy
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    user_params = params.require(:user).permit(:username, :password, :password_confirmation, :phone_number, :email)
  end
end
