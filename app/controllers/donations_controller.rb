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
    donation = Donation.create(donation_params)
    redirect_to donation
  end

  def edit
  end

  def update
    @donation.update(donation_params)
    redirect_to @donation
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
    params.require(:donation).permit(:title, :description, :user_id, :category_id, :location_id, :picture)
  end
end
