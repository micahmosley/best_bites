class FavoriteMealsController < ApplicationController

    before_action :authentication_required, :current_user

    def create 
       
        if params[:favorite_meal]==nil
            redirect_to meals_path 
        end 
        
        current_favorite=FavoriteMeal.find_or_create_by(user_id: session[:user_id])
        current_favorite.meal_id=favorite_meal_params[:meal_id]
        current_favorite.save
        redirect_to meals_path
        
    end 

    def update 
        if params[:favorite_meal]==nil
            redirect_to meals_path 
        end 
        
        current_favorite=FavoriteMeal.find_by(user_id: session[:user_id])
        current_favorite.update(favorite_meal_params)
        redirect_to meals_path
    end 

    private 
        def favorite_meal_params 
            params.require(:favorite_meal).permit(:meal_id)
        end 

        
    
end 