class Addmenustable < ActiveRecord::Migration
  def up

    create_table :menus do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.string :food_genre_id
      t.integer :cafe_id
      t.timestamps
    end

    create_table :cafes do |t|
      t.string :name
      t.string :description
      t.string :logo_img
    end

    create_table :food_genres do |t|
      t.string :name
      t.text :description
    end

    create_table :users do |t|
      t.string :fn
      t.string :ln
      t.string :username
      t.integer :phone
      t.string :email
      t.string :role
    end

     create_table :orders do |t|
      t.date :pickup_dt
      t.time :pickup_time
      t.integer :menu_id
      t.integer :cafe_id
      t.integer :user_id
      t.timestamps
    end
  end

  def down
    drop_table :users
    drop_table :cafes
    drop_table :menus
    drop_table :food_genres
    drop_table :orders
  end
end
