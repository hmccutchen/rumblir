require 'sinatra'
require 'sinatra/activerecord'
enable :sessions

require 'active_record'

# set :database, 'sqlite3:rumblir.sqlite3'
ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])

get '/' do


@posts = Post.all


erb :home
end



get '/signup' do

erb :signup
end


post '/signup' do

user = User.create( first_name: params[:name],
                    last_name:  params[:last_name],
                    birthday:   params[:date],
                    email: params[:email],
                    password: params[:password]
  )
session[:user] = user
redirect :account
end

get '/account' do

@user_post = session[:user].posts


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
  redirect :/
end
end




get '/post/:id' do

  @apost = Post.find(params[:id])

erb :show
end


get '/user/:id' do

  post = Post.where(user_id: params[:id] )
  user_post = post.select( :user_id, :content, :title, :image)
  @user_posts = user_post.all

erb :user
  end


get '/post' do


erb :post
end






post '/post' do

  @current_user = session[:user]

@post = @current_user.posts.create( title: params[:title],
                    content: params[:content],
                    image: params[:image]
  )



redirect :account

end



get '/logout' do

session[:user] = nil
p "logged out"
redirect :/

end


get '/delete' do

user = User.find(session[:user].id).destroy

session[:user] = nil

redirect :/
end





require './models'
require './models/post.rb'
