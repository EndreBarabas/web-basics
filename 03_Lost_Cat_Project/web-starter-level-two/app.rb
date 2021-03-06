# These lines load Sinatra and a helper tool to reload the server
# when we have changed the file.
require "sinatra/base"
require "sinatra/reloader"

# You will want to require your data model class here
require "animal_list"
require "cat_container"
require "cat"

class WebApplicationServer < Sinatra::Base
  # This line allows us to send HTTP Verbs like `DELETE` using forms
  use Rack::MethodOverride

  configure :development do
    # In development mode (which you will be running) this enables the tool
    # to reload the server when your code changes
    register Sinatra::Reloader
  end

  before do
    # This sets up the global data store. You will use this for your data model.
    # In future you will use a database instead.
    $global ||= {}
  end

  # Start your server using `rackup`.
  # It will sit there waiting for requests. It isn't broken!

  # YOUR CODE GOES BELOW THIS LINE

  get "/cats" do
    erb :cats_index, locals: { cats: cat_container.list }
  end

  get "/cats/new" do
    erb :cats_new
  end

  post "/cats" do
    name = params[:name]
    number = params[:number]
    description = params[:description]
    new_cat = Cat.new(name, number, description)
    cat_container.add(new_cat)
    status 200
    redirect "/cats"
  end

  delete "/cats/:index" do
    cat_container.remove(params[:index].to_i)
    redirect "/cats"
  end

  #I created this
  # get "/cats/:index/edit" do
  #   erb :cats_edit, local: {
  #                     entry: cat.get(params[:index].to_i),
  #                   }
  # end

  get "/cats/:index/edit" do
    cat_index = params[:index].to_i
    erb :cats_edit, locals: {
                      index: cat_index + 1,
                      cat: cat_container.get_cat(cat_index),
                    }
  end

  patch "/cats/:index/edit" do #this is going to be a patch
    cat_index = params[:index].to_i
    erb :cats_edit, locals: {
                      index: cat_index + 1,
                      cat: cat_container.get_cat(cat_index),
                    }
  end

  # I created this
  # patch "/cats/:index/edit" do
  #   erb :cats_edit, local: {
  #                     entry: cat.get(params[:index].to_i + 1),
  #                   }
  # end

  # This is an example of setting up a new instance using the global data store.
  def cat_container
    $global[:cat_container] ||= CatContainer.new
  end

  # EXAMPLE ROUTES

  get "/animals" do
    erb :animals_index, locals: { animals: animal_list.list }
  end

  get "/animals/new" do
    erb :animals_new
  end

  post "/animals" do
    animal_list.add(params[:species])
    redirect "/animals"
  end

  delete "/animals/:index" do
    animal_list.remove(params[:index].to_i)
    redirect "/animals"
  end

  get "/animals/:index/edit" do
    animal_index = params[:index].to_i
    erb :animals_edit, locals: {
                         index: animal_index,
                         animal: animal_list.get(animal_index),
                       }
  end

  patch "/animals/:index" do
    animal_index = params[:index].to_i
    animal_list.update(animal_index, params[:species])
    redirect "/animals"
  end

  def animal_list
    $global[:animal_list] ||= AnimalList.new
  end
end
