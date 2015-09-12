class Addcafelocation < ActiveRecord::Migration
  def up
    add_column :cafes, :location, :string
    add_column :cafes, :mycafe_id, :integer
    add_column :menus, :mycafe_id, :integer
    add_column :food_genres, :myfood_genres_id, :integer
    add_column :menus, :myfood_genres_id, :integer
    add_column :menus, :menu_img, :string
    add_column :food_genres, :foodgenre_img, :string


  end

   def down
    remove_column :cafes, :location
    remove_column :cafes, :mycafe_id
    remove_column :menus, :mycafe_id
    remove_column :food_genres, :myfood_genres_id
    remove_column :menus, :myfood_genres_id
    remove_column :menus, :menu_img
    remove_column :food_genres, :foodgenre_img
  end
end
