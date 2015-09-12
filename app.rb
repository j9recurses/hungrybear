# encoding: utf-8
require 'multi_json'
require 'sinatra'
require 'sinatra/activerecord'
require 'mysql2'
require 'pluck_to_hash'
require 'friendly_id'

class MenuApp < Sinatra::Application
  enable :sessions
  #https://github.com/jsmestad/sinatra_warden
  #https://sideprojectsoftware.com/blog/2015/02/22/sinatra-authentication.html

  settings = YAML::load(File.open('config/database.yml'))
  settings = settings['development']



  configure :development do
    enable :raise_errors, :sessions, :logging

    ActiveRecord::Base.establish_connection(
      adapter: 'mysql2',
      username: 'myrailsbuddy',
      password: 'mypass',
      host: 'localhost',
    database: 'menuapp_development')
  end
  set :root, File.dirname(__FILE__)
  set :static, true
  set :public_folder, 'public'

end

require_relative 'config/initializers/inflections.rb'
require_relative 'helpers/init'
require_relative 'models/init'
require_relative 'routes/init'
