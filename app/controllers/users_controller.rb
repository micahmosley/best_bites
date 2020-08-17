class UsersController < ApplicationController 
    def new 
        @user = User.new
    end 

    def create 
        @user = User.create(user_params)
        #should add some validations in user model and check to see if the 
        # user that was created was valid, hense actually created. If it was, 
        # we'd redirect to user profile page or main page. If not, render new
        # user page again with errors displayed. 
    end 

    def show 
    end 

    private 

    def user_params 
        params.require(:user).permit(:first_name, :last_name, :username, :password)
    end 
end 



