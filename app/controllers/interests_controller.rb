class InterestsController < ApplicationController
  def new
    byebug
    
    @interest = Interest.new
  end

  def create
    # byebug
    @donation = Donation.find(interest_params[:donation_id])
    if logged_in?
      @interest = Interest.new(interest_params)
      if @interest.save
        flash[:notices] = ["Success! You have shown interest in this donation.", 
        "You and the item owner can now see each other's phone numbers."]
        redirect_to donation_path(@donation)
      else
        flash[:errors] = ["Failed to show interest", @interest.errors.full_messages].flatten
        redirect_to donation_path(@donation)
      end
    else
      flash[:errors] = ["You must be logged in to show interest in a donation"]
      redirect_to donation_path(@donation)
    end
  end

  def delete
    @interest = Interest.all.find{|interest| interest.donation_id == params[:donation_id].to_i && interest.user == @current_user}
    @interest.destroy
    flash[:notices] = ["Interest removed."]
    redirect_to donation_path(params[:donation_id])
  end

  private

  def interest_params
    interest_params = params.require(:interest).permit(:donation_id)
    interest_params.merge!(user_id: @current_user.id) if logged_in?
    interest_params
  end
end
