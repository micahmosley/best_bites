class UsersController < ApplicationController 

    before_action :authentication_required, :current_user, except: [:new, :create]
    before_action :find_user, only: [:edit, :update]

    def new 
        @user = User.new
    end 

    def home 
    end 

    def create 
        @user = User.create(user_params)

        if @user.valid? == true 
            session[:user_id] = @user.id
            redirect_to home_path
        else 
            flash[:errors] = @user.errors.full_messages
            render new_user_path
        end 
    end 

    def show 
    end 

    def edit 
    end 

    def update 
        @user.update(user_params)
        @user.save
        redirect_to user_path(@user)
    end 

    private 

    def find_user
        @user = User.find(params[:id])
    end

    def user_params 
        params.require(:user).permit(:first_name, :last_name, :username, :password)
    end 
end 



