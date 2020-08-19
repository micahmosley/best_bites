class Meal < ApplicationRecord
    has_many :favorite_meals
    has_many :users, through: :favorite_meals
    has_one_attached :photo
    validates :name, presence: true 
    validates :name, uniqueness: true
    validates :recipe, presence: true
    validates :photo, presence: true

    def number_of_favorites
        self.favorite_meals.length
    end 

    def self.h
        h={}
        self.all.each do |meal| 
            h[meal.id]=meal.number_of_favorites
        end 
        #hash keys are dessert_ids and values are num of favorites ordered greatest to least
        h.sort_by {|k,v| -v}
    end 

    def self.top_ten_ids
        ids=self.h.map do |hash_pair|
            hash_pair[0]
        end 
        #only take ten ids
        ids.slice(0,10)
    end 

    def self.top_ten 
        self.top_ten_ids.map do |id| 
            Meal.find(id)
        end 

    end 
   
end
