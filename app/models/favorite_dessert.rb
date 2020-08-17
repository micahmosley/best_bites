class FavoriteDessert < ApplicationRecord
    belongs_to :dessert 
    belongs_to :user
end
