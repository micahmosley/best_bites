class Dessert < ApplicationRecord
    has_many :favorite_desserts 
    has_many :users, through: :favorite_desserts 
end
