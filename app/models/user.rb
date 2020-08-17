class User < ApplicationRecord
    has_one :favorite_dessert 
    has_one :favorite_meal 
end
