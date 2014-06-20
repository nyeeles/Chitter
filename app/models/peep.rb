class Peep

	include DataMapper::Resource

	property :id, Serial
	property :post, Text
	property :author, String

end