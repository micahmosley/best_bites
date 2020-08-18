class FavoriteDessertsController < ApplicationController

    before_action :authentication_required, :current_user

    def create 
        # can only create if you are logged in 
        return head(:forbidden) unless session.include? :user_id

        #delete current favorite dessert if there is one
        current_favorite=FavoriteDessert.find(user_id: session[:user_id])
        current_favorite.delete

        #add new favorite dessert
        FavoriteDessert.create(favorite_dessert_params, user_id: session[:user_id])
        #redirect to your profile page
    end 

    


    private 
        def favorite_dessert_params 
            params.require(:favorite_dessert).permit(:dessert_id)
        end 
    
end 