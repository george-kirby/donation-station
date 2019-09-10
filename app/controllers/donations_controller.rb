class DonationsController < ApplicationController

  before_action :find_donation, only: [:show, :edit, :update, :destroy]

  def index
    @donations = Donation.all
  end


  def search_results
    @donations = Donation.where("title || description LIKE ?", "%#{params[:q]}%")

    unless donation_params[:location_id] == ""
      @donations = @donations.select {|donation| donation.location_id == donation_params[:location_id].to_i}
    end

    unless donation_params[:category_id] == ""
      @donations = @donations.select {|donation| donation.category_id == donation_params[:category_id].to_i}
    end

    @donations

    render :index
  end

  def search_by_location
    @donations = Donation.all
  end

  def new
    @donation = Donation.new
  end

  def show
    @interest = Interest.new
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

  def current_user_donations
    @donations = @current_user.my_donations
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
