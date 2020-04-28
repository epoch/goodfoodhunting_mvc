# dependencies
require 'sinatra'
require 'sinatra/reloader' # only reloads main.rb
require 'pg' # to connect to the db
require 'pry'

require_relative 'models/user'
require_relative 'models/dish'
require_relative 'lib'

enable :sessions # plural - this is a sinatra feature


get '/' do
  dishes = all_dishes()
  erb(:'/dishes/index', locals: { dishes: dishes })
end

get '/dishes/new' do
  erb(:'/dishes/new')
end

get '/dishes/:id' do
  dish = find_one_dish_by_id(params[:id])
  user = find_one_user_by_id(dish["user_id"])

  erb(:'/dishes/show', locals: { dish: dish, user: user } )
end

post '/dishes' do
  # guard condition
  redirect "/login" unless logged_in?

  create_dish(params[:name], params[:image_url], current_user['id'])
  redirect "/"
end

delete '/dishes' do
  delete_dish(params[:id])
  redirect "/"
end

get '/dishes/:id/edit' do
  dish = find_one_dish_by_id(params[:id])
  
  erb(:'/dishes/edit', locals: { dish: dish })
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
  erb :'/sessions/login'
end

post '/login' do
  user = find_one_user_by_email( params[:email] )

  if user && BCrypt::Password.new(user["password_digest"]) == params[:password]
    session[:user_id] = user['id'] # write down that this user is logged in
    redirect "/"
  else
    erb :'/sessions/login'
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


# 1. helpers - DONE
# 2. posting new dish - MISSING THING - DONE
# 3. organizing files
# 4. hackers - horrible - security - user inputs - never trust it
# 5. strings
# 6. deployment

