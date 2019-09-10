class DonationsController < ApplicationController

  before_action :find_donation, only: [:show, :edit, :update, :destroy]

  def index
    @donations = Donation.all
  end

  def new
    @donation = Donation.new
  end

  def show
  end

  def create
    @donation = Donation.new(donation_params)
    if @donation.save
      flash[:notices] = ["Donation created! Thank you"]
      redirect_to donation_path(@donation)
    else
      flash[:errors] = ["Donation not created", @donation.errors.full_messages].flatten
      render :new
    end
  end

  def edit
  end

  def update
    if @donation.update(donation_params)
      flash[:notices] = ["Donation updated successfully!"]
      redirect_to @donation
    else
      flash[:errors] = ["Donation not updated", @donation.errors.full_messages].flatten
      render :edit
    end
  end

  def user_donations
    
  end

  def destroy
    @donation.destroy
    redirect_to donations_path
  end

  def interests
  end

  private

  def find_donation
    @donation = Donation.find(params[:id])
  end

  def donation_params
    donation_params = params.require(:donation).permit(:title, :description, :category_id, :location_id, :picture)
    donation_params.merge!(user_id: @current_user.id)
  end
end
