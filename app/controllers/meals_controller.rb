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

    # Put in Validations
    def delete
        # only if you created the dessert
        @meal.delete 
        redirect_to :meals_path
    end 

    def top_ten 
        @top_ten=Meal.top_ten
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