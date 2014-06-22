require 'sinatra'
require 'data_mapper'
require_relative 'models/peep'
require_relative 'models/user'
require_relative 'data_mapper_setup'
require_relative 'helpers/app_helpers'

enable :sessions
set :sessions_secret, 'super secret'

get '/' do
	@peeps = Peep.all
	erb :index
end

post '/' do
	post = params["post"]
	post_time = Time.now.strftime("%H:%M, %d-%m-%y")
	author = current_user.name
	Peep.create(post: post, post_time: post_time, author: author)
	redirect to '/'
end

delete '/' do
	session[:user_id] = nil
	redirect to '/'
end

get '/sign-up' do
	erb :"sign-up"
end

post '/sign-up' do
	user = User.create(
										name: params[:name].split(' ').each(&:capitalize!).join(' '),
										username: params[:username],
										email: params[:email],
										password: params[:password])
	session[:user_id] = user.id
	redirect to '/'
end

get '/login' do
	erb :login
end

post '/login' do
	email, password = params[:email], params[:password]
	user = User.authenticate(email, password)
	if user
		session[:user_id] = user.id
		redirect to '/'
	else
		flash[:errors] = ["The email or password is incorrect"]
		erb :"/login"
	end
end

