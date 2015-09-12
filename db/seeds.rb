#seed the project table
#<a href="#/projects#{{project.tags[0]}}"> cool</a>
require "sinatra/activerecord"
require File.expand_path('../../models/models.rb', __FILE__)


Cafe.delete_all
Cafe.create(name: "Golden Bear Cafe", mycafe_id:1,  location:"Cesar Chavez Student Center, Upper Sproul Plaza", logo_img:"gbc.gif" , description: 'Located in the heart of campus in the famous Sproul Plaza, The Golden Bear offers a great mix of made-to-order meals, grab-and-go sandwiches and items, Kosher sandwiches, sushi, bento boxes, salads, bagel bar, deli, salads, grilled items, made-to-order smoothies, and natural earth-friendly items.')
Cafe.create(name: "Qualcomm Cafe", mycafe_id:2, location:"Sutardja Dai Hall", logo_img:"qualcomm_logo.gif",  description: "The Qualcomm Cafe is Cal Dining's most popular location among vegetarians for our offerings, salads, made-to-order wraps, and other grab-and-go items. Featuring a Peet’s Coffee & Tea, Located on the north side of campus, QC2 is perfect for getting coffee between classes or sitting down for lunch.")
Cafe.create(name: "Pat Browns", mycafe_id:3, location:"Genetics and Plant Biology Building", logo_img:"patbrowns_log.jpg",  description: "Serving the northwest part of campus, brown's is committed to serving local foods grown, milled, preserved, and processed within 250 miles of the UC Berkeley campus whenever possible. The brown's kitchen uses scratch-cooking techniques to produce delicious vegetable-forward menu items as well as 'better meat' options such as grassfed burgers and rotisserie organic chicken. Stop in to enjoy a meal that bridges nutrition, sustainability, and taste on our outdoor patio. Genetics and Plant Biology Building.")
Cafe.create(name: "Terrace Cafe", mycafe_id:4, location:"Bechtel Building Rooftop", logo_img:"terrace_logo.gif" , description: "Designed for quick service on the run, Terrace Café features a variety of popular grab-and-go salads, sushi, sandwiches and great coffee.")

Food_genre.delete_all
Food_genre.create(name:"Sandwiches", foodgenre_img:'sandwiches.jpg' , myfood_genres_id:1, description:"Two slices of bread with lots of good stuff in-between.")
Food_genre.create(name:"Hot Meals", foodgenre_img:'hotmeals.jpg', myfood_genres_id:2, description:"Served piping hot, these items are guarenteed to fill you up.")
Food_genre.create(name:"Light and Healthy", foodgenre_img:"salad.jpg", myfood_genres_id:3, description:"Improve your eating habits with healthy food choices you can incorporate in your everyday life.")
Food_genre.create(name:"Comfort Foods", foodgenre_img:"comfortfoods.jpg", myfood_genres_id:4, description:"These menu items will instantly provide you with that warm, fuzzy feeling and can bring you right back to your best memories.")

gb = Cafe.where(mycafe_id: 1).pluck(:id).join("").to_i
qcafe = Cafe.where(mycafe_id: 2).pluck(:id).join("").to_i
pb = Cafe.where(mycafe_id: 3).pluck(:id).join("").to_i
tr = Cafe.where(mycafe_id: 4).pluck(:id).join("").to_i



Menu.delete_all
Menu.create(name:"Turkey Club", price:7.50, cafe_id:gb, menu_img:"sandwiches.jpg", description:"Turkey, bacon, swiss, lettuce, tomato & chipotle Sauce served on sourdough bread.")
Menu.create(name:"Mac and Cheese", price:8.25, cafe_id:gb, menu_img:"mac.jpg", description:"Cheesey and Hot!")
Menu.create(name:"Pizza", price:8.50, cafe_id:gb, menu_img:"pizza.jpg", description:"Cheesy and lots of toppings! Will satisfy.")
Menu.create(name:"Chicken Tenders", price:6.50, menu_img:"comfortfoods.jpg", cafe_id:gb, description:"Crispy and delicious!")
