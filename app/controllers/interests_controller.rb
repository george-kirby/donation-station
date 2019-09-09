class InterestsController < ApplicationController
  def new
    @interest = Interest.new
  end

  def create
    Interest.create(interest_params)
    redirect_to donations_path
  end

  private

  def interest_params
    params.require(:interest).permit(:user_id, :donation_id)
  end
end
