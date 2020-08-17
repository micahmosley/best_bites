class SessionsController < ApplicationController

    def new 
    end 

    def create 
        binding.pry
        #from here, need to find user using params from form, and then 
        # depending on if we are able to find it or not, render login_path
        #or redirect to user profile page or main page 
    end 

    def destroy 
        #eventual logout button will lead to this path
        reset_session 
        redirect_to login_path
    end  
end 