require 'sinatra'

env = ["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './models/peep'
DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do
	"hello world"
end