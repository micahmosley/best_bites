class DessertsController < ApplicationController
   
    before_action :authentication_required, :current_user
    before_action :find_dessert, only: [:show, :edit, :update, :delete]
    before_action :fav_dessert, only: [:new, :show]
    def index 
        @desserts=Dessert.all
    end 

    def new 
        @dessert=Dessert.new
    end 

    def show 
        
    end 

    def create
        @dessert=Dessert.new(dessert_params)
        if @dessert.valid?
            @dessert.save 
            redirect_to dessert_path(@dessert)
        else 
            render :new
        end 
    end 

   
    def edit 
        
    end 

    def update
        @dessert.update(dessert_params)
        if @dessert.valid?

          redirect_to dessert_path(@dessert)
        else 
          render :edit 
        end 
    
    end

    def top_ten 
        @top_five=Dessert.top_ten.slice(0,5)
        @second_five=Dessert.top_ten.slice(5,10)
    end 

    private 
        
        def find_dessert 
            @dessert=Dessert.find(params[:id])
        end 

        def dessert_params 
            params.require(:dessert).permit(:name, :recipe, :photo)
        end 

        def fav_dessert 
            @fav_dessert=FavoriteDessert.find_or_create_by(user_id: session[:user_id])
        end

end 