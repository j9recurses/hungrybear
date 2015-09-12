require './app'
require 'sinatra/activerecord/rake'
require 'mysql2'

desc "List all routes for this application"
task :routes do
  puts `grep '^[get|post|put|delete].*do$' routes/*.rb | sed 's/ do$//'`
end


namespace :db do
  task :load_config do
    require "./app"
  end

end
