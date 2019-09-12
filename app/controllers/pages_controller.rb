class PagesController < ApplicationController
  def home
    session.delete(:donation_id)
    
    @trending_donation = Donation.most_interests
    @trending_user = User.most_interests_received
    @location_with_most_donations = Location.most_donations
    @category_with_most_donations = Category.most_donations
    @user_with_most_donations = User.most_donations
  end

  def about
  end
end
