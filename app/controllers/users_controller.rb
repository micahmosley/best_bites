class UsersController < ApplicationController 
    def new 
        @user = User.new
    end 

    def create 
        @user = User.create(user_params)

        if @user.valid? == true 
            session[:user_id] = @user.id
            binding.pry
            #redirect to root 
        else 
            flash[:errors] = @user.errors.full_messages
            render new_user_path
        end 
    end 

    def show 
    end 

    private 

    def user_params 
        params.require(:user).permit(:first_name, :last_name, :username, :password)
    end 
end 



