require 'sinatra'
require 'data_mapper'

env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require_relative 'models/peep'
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