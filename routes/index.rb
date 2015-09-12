# encoding: utf-8

  get '/' do
   @cafes = Cafe.all
   @cafe_ids= @cafes.pluck(:id).join(",")
   puts @cafe_ids
   @food_generes = Food_genre.all
   erb :index
  end

  get '/menus/:id' do
   @params = params
   @cafe = Cafe.find(params[:id])
   @cafe_name =  @cafe.name
  # @cafe_name = @cafe.pluck([:name]).join("")
   @menu_items = @cafe.menus
   @menu_items_ids = Array.new
   @menu_items.each do | item|
    @menu_items_ids.push(item.id.to_s)
  end
   @menu_items_ids = @menu_items_ids.join(",")
   erb :menu
  end

  post '/userlunchbag/new' do
    puts "posting"
    puts params
    status 202
  end


#   get '/projects' do
#     @projects = Project.all
#     @projects_size = @projects.size
#     @projects.to_json(:methods => [:project_size, :skills_str , :role_str] )
#   end

#   get '/projects/:id' do
#     #@project = Project.find(params[:id])
#     @project = Project.find_by_slug(params[:id])
#     # unless @project[:toolbox_ids].nil?
#     #   @project.tools = @project[:toolbox_ids].join(", ")
#     # end
#     # unless @project[:skills].nil?
#     #   @project.skills_str = @project[:skills].join(", ")
#     # end
#     # unless @project[:role].nil?
#     #   @project.role_str = @project[:role].join(", ")
#     # end
#     unless @project.description.nil?
#       @project.description = @project.description.gsub("'", '')
#     end
#     @project.to_json #(:methods => [:tools, :skills_str , :role_str] )
#   end

#   get '/projectCategories' do
#     @project_categories = ProjectType.all
#     @project_categories.to_json
#   end

#   get '/toolboxCategories' do
#     @toolbox_categories = Toolbox.all
#     @toolbox_categories.to_json
#   end
# end
