require 'sinatra'
require 'data_mapper'
enable :sessions
set :sessions_secret, 'super secret'

env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require_relative 'models/peep'
require_relative 'models/user'
DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do
	@peeps = Peep.all
	erb :index
end

post '/' do
	post = params["post"]
	Peep.create(post: post)
	redirect to '/'
end

get '/sign-up' do
	erb :"sign-up"
end

post '/sign-up' do
	user = User.create(username: params[:username],
							email: params[:email],
							password: params[:password])
	session[:user_id] = user.id
	redirect to '/'
end

get '/login' do
	erb :login
end

helpers do
	def current_user
		@current_user ||=User.get(session[:user_id]) if session[:user_id]
	end
end
