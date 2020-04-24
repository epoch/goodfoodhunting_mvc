# dependencies
require 'sinatra'
require 'sinatra/reloader' # only reloads main.rb
require 'pg' # to connect to the db
require 'pry'

require_relative 'models/dish'

get '/' do
  dishes = all_dishes()
  erb(:index, locals: { dishes: dishes })
end

get '/dishes/new' do
  erb(:new)
end

get '/dishes/:id' do
  dish = find_one_dish_by_id(params[:id])
  erb(:show, locals: { dish: dish } )
end

post '/dishes' do
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
