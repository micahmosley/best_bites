class CreateFavoriteDesserts < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_desserts do |t|
      t.integer :user_id
      t.integer :dessert_id

      t.timestamps
    end
  end
end
