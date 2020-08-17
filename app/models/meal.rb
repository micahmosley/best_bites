class Meal < ApplicationRecord
    has_many :favorite_meals
    has_many :users, through: :favorite_meals
end
