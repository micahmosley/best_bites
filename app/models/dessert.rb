class Dessert < ApplicationRecord
    has_many :favorite_desserts 
    has_many :users, through: :favorite_desserts 
    has_one_attached :photo
    validates :name, presence: true 
    validates :name, uniqueness: true
    validates :recipe, presence: true
    validates :photo, presence: true

    # def number_of_favorites
    #     self.favorite_desserts.length
    # end 

    # def self.hash 
    #     hash={}
    #     self.all.each do |dessert| 
    #         hash[dessert.id]=dessert.number_of_favorites
    #     end 
    #     #hash keys are dessert_ids and values are num of favorites ordered greatest to least
    #     hash.sort_by {|k,v| -v}
    # end 

    # def self.top_ten 
    #     ids=self.hash.map do |hash_pair|
    #         hash_pair[0]
    #     end 
    #     #only take ten ids
    #     ids.slice(0,10)
    # end 
   
end
