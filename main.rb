# dependencies
require 'sinatra'
require 'sinatra/reloader' # only reloads main.rb
require 'pg' # to connect to the db
require 'pry'


# lib.rb
# require_relative 'view_helpers'

require_relative 'models/dish'
require_relative 'models/user'

enable :sessions # plural - this is a sinatra feature

# helper method
# predicate method
def logged_in? # return a boolean
  # !!session[:user_id]
  if session[:user_id] # -> convert to a boolean 
    true
  else
    false
  end
end


get '/' do
  dishes = all_dishes()
  erb(:index, locals: { dishes: dishes })
end

get '/dishes/new' do
  erb(:new)
end

get '/dishes/:id' do
  dish = find_one_dish_by_id(params[:id])
  user = find_one_user_by_id(dish["user_id"])

  erb(:show, locals: { dish: dish, user: user } )
end

post '/dishes' do
  # guard condition
  redirect "/login" unless logged_in?

  # if !logged_in?
  #   redirect "/login"
  # end

  create_dish(params[:name], params[:image_url])
  redirect "/"
end

delete '/dishes' do
  delete_dish(params[:id])
  redirect "/"
end

get '/dishes/:id/edit' do
  dish = find_one_dish_by_id(params[:id])
  
  erb(:edit, locals: { dish: dish })
end

patch '/dishes' do
  update_dish(
    params[:id], 
    params[:name], 
    params[:image_url]
  )
  redirect "/dishes/#{params[:id]}"  
end

# 🎉🎉🎉🎉🎉🎉

get '/donate' do
  "gimme money thank you"
end

get '/login' do
  erb :login
end

post '/login' do
  user = find_one_user_by_email( params[:email] )

  if user && BCrypt::Password.new(user["password_digest"]) == params[:password]
    session[:user_id] = user['id'] # write down that this user is logged in
    redirect "/"
  else
    erb :login
  end
end

delete '/logout' do
  # 1 its crud - destroy - what?
  session[:user_id] = nil

  # 2 not a safe method so redirect to a get
  # redirect to where???
  # login page may be????
  redirect "/login"
end