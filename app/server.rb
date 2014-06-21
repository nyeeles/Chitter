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
