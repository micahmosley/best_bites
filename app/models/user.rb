class User < ApplicationRecord
    has_secure_password

    has_one :favorite_dessert 
    has_one :favorite_meal 

    validates :first_name, presence: true 
    validates :last_name, presence: true 
    validates :username, presence: true 
    validates :username, uniqueness: true 
    validates :password, presence: true 
end
