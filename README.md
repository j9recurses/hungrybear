#Hungry Bear- A Lunch Time Ordering App

##Installation Instructions
Assumes that you have ruby, mysql and bower installed

###Install Gems and Bower packages to get dependencies
bundle install
bower install

###Create and Seed the DB
cd into the app root dir
then:
  rake db:setup
  rake db:seed
