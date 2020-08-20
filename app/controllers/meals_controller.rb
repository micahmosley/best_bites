class MealsController < ApplicationController
    before_action :authentication_required, :current_user
    before_action :find_meal, only: [:show, :edit, :update, :delete]
    before_action :fav_meal, only: [:new, :show]
    def index 
        @meals=Meal.all
    end 

    def new 
        @meal=Meal.new
    end 

    def show 
        
    end 

    def create 
        
        @meal=Meal.new(meal_params)
        if @meal.valid?
            @meal.save 
            redirect_to meal_path(@meal)
        else 
            render :new
        end 
    end 

     
    def edit 
       
    end 

    def update
        @meal.update(meal_params)
        if @meal.valid?

          redirect_to meal_path(@meal)
        else 
          render :edit 
        end 
    
    end



    def top_ten 
        @top_five=Meal.top_ten.slice(0,5)
        @second_five=Meal.top_ten.slice(5,10)
    end 

    private 
        
        def find_meal
            @meal=Meal.find(params[:id])
        end 

        def meal_params 
            params.require(:meal).permit(:name, :recipe, :photo)
        end 

        def fav_meal
            @fav_meal=FavoriteMeal.find_or_create_by(user_id: session[:user_id])
        end

end 