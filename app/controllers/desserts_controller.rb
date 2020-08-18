class DessertsController < ApplicationController
   
    before_action :find_dessert, only: [:show, :edit, :update, :delete]
    before_action :fav_dessert, only: [:new, :show]
    def index 
        @desserts=Dessert.all
    end 

    def new 
        # will not let you create a new dessert if you are not logged in
        return head(:forbidden) unless session.include? :user_id
        @dessert=Dessert.new
    end 

    def show 
        
    end 

    def create 
        
        @dessert=Dessert.new(dessert_params)
        if @dessert.valid?
            # @dessert.photo.attach(params[:dessert][:photo])
            @dessert.save 
            redirect_to dessert_path(@dessert)
        else 
            render :new
        end 
    end 

     # Put in Validations
    def edit 
        # only if you created the dessert
    end 

    def update
        @dessert.update(dessert_params)
        if @dessert.valid?

          redirect_to dessert_path(@dessert)
        else 
          render :edit 
        end 
    
    end

    # Put in Validations
    def delete
        # only if you created the dessert
        @dessert.delete 
        redirect_to :desserts_path
    end 

    def top_ten 
        @top_ten=Dessert.top_ten
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