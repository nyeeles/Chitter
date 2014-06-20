require 'sinatra'
require 'data_mapper'

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
	User.create(username: params[:username],
							email: params[:email])
	redirect to '/'
end

get '/login' do
	erb :login
end
