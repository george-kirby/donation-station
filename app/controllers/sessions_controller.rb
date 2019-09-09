class SessionsController < ApplicationController

    def new
    end

    def create
        @username = params[:username]
        @password = params[:password]
        if valid_credentials?
            @user = User.find_by(username: @username)
            session[:user_id] = @user.id
            flash[:notices] = ["Welcome, #{@user.username}"]
            redirect_to user_home_path
        else
            flash[:errors] = ["Login failed - invalid credentials"]
            redirect_to login_path
        end
    end

    def destroy
        session.delete(:user_id)
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