class SessionsController < ApplicationController

    def new
    end

    def create
        @username = params[:username]
        @password = params[:password]
        if valid_credentials?
            session[:user_id] = User.find_by(username: @username).id
            flash[:notices] = ["Welcome, #{@username}"]
            if session[:donation_id]
                redirect_to donation_path(session[:donation_id])
            else
                redirect_to root_path
            end
        else
            flash[:errors] = ["Login failed - invalid credentials"]
            redirect_to login_path
        end
    end

    def destroy
        session.delete(:donation_id)
        session.delete(:user_id)
        flash[:notices] = ["Logged out successfully"]
        redirect_to root_path
    end

    private

    def valid_credentials?
        if User.usernames.include?(@username)
            if User.find_by(username: @username).password == @password
                true
            else
                false
            end
        else
            false
        end
    end

end