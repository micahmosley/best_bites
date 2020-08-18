class SessionsController < ApplicationController

    def new 
    end 

    def create 
        @user = User.find_by(username: params[:username])

        if @user == nil 
            flash[:errors] = "Sorry, user with that username does not exist"
            redirect_to login_path 
        else 
            if @user.authenticate(params[:password])
                session[:user_id] = @user.id
                # redirect to root 
            else 
                flash[:errors] = "Sorry, user with that password does not exist"
                redirect_to login_path
            end
        end 
    end 

    def destroy 
        #eventual logout button will lead to this path
        reset_session 
        redirect_to login_path
    end  
end 

