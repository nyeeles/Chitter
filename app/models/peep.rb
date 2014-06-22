class Peep

	include DataMapper::Resource

	property :id, Serial
	property :post, Text
	property :post_time, String
	property :author, String

end