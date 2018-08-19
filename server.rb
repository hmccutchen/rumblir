require 'sinatra'
require 'sinatra/activerecord'
enable :sessions

set :database, 'sqlite3:rumblir.sqlite3'


get'/home' do


@posts = Post.all


erb :home
end



get '/signup' do

erb :signup
end


post '/signup' do
p params

user = User.create( name: params[:name],
                    email: params[:email],
                    password: params[:password]
  )
session[:user] = user
redirect :account
end

get '/account' do


erb :account
end


get '/login' do

erb :login
end


post '/login' do

email = params[:email]
given_password = params[:password]

user = User.find_by(email: email)
if user.password == given_password
  session[:user] = user
redirect :account
else
  p "invalid credentials"
  redirect :home
end
end



# get 'user/:id/post' do

# @user

# erb :post
# end



get '/post/:id' do

@post = Post.find(params[:id])

erb :show
end


get '/post' do


erb :post
end

# def current_user
# @user = User.find(params)
# end


post '/post' do

 p current_user = session[:user]

@post = current_user.posts.create( title: params[:title],
                    content: params[:content],
                    image: params[:image]
  )



redirect :home
end



get '/logout' do

session[:user] = nil
p "logged out"
redirect :home

end



require './models'
require './models/post.rb'
