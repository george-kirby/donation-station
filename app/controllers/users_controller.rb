class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit, :update]

  def login
    @user = User.new
  end

  def new
  end

  def show
  end

  def create
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
end
