class UsersController < ApplicationController

  before_action :find_user, only: :show

  def new
    @user = User.new
  end

  def show
    if @user == @current_user
      redirect_to edit_user_path
    else
      @donations = @user.my_donations
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notices] = ["Account created! Please log in"]
      redirect_to login_path
    else
      flash[:errors] = ["Registration failed:", @user.errors.full_messages].flatten
      render :new
    end
  end

  def edit
  end

  def update
    if @current_user.update(user_params)
      flash[:notices] = ["Account updated successfully!"]
      redirect_to root_path
    else
      flash[:errors] = ["Account not updated", @current_user.errors.full_messages].flatten
      render :edit
    end
  end

  def confirm_account_deletion

  end

  def destroy
    # byebug
    if user_params[:password] == @current_user.password
      @current_user.destroy
      session.delete(:user_id)
      flash[:notices] = ["Account deleted"]
      redirect_to root_path
    else
      flash[:errors] = ["Invalid password. Account not deleted"]
      redirect_to edit_user_path
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    user_params = params.require(:user).permit(:username, :password, :password_confirmation, :phone_number, :email)
  end
end
