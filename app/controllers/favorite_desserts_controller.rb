class FavoriteDessertsController < ApplicationController

    before_action :authentication_required, :current_user

    def create 
       
        if params[:favorite_dessert]==nil
            redirect_to desserts_path 
        end 
        
        current_favorite=FavoriteDessert.find_or_create_by(user_id: session[:user_id])
        current_favorite.dessert_id=favorite_dessert_params[:dessert_id]
        current_favorite.save
        redirect_to desserts_path
        
    end 

    def update 
        if params[:favorite_dessert]==nil
            redirect_to desserts_path 
        end 
        
        current_favorite=FavoriteDessert.find_by(user_id: session[:user_id])
        current_favorite.update(favorite_dessert_params)
        redirect_to desserts_path
    end 

    private 
        def favorite_dessert_params 
            params.require(:favorite_dessert).permit(:dessert_id)
        end 

        
    
end 