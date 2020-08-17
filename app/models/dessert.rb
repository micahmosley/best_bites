class Dessert < ApplicationRecord
    has_many :favorite_desserts 
    has_many :users, through: :favorite_desserts 
    has_one_attached :photo
    validates :name, presence: true 
    validates :recipe, presence: true
    validates :photo, presence: true
   
end
