class ApplicationController < ActionController::Base

    before_action :set_current_user

    helper_method :logged_in?

    def set_current_user
        @current_user = session[:username] ? User.find_by(username: session[:username]) : nil
    end

    def logged_in?
        !!@current_user
    end

end
