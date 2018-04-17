require "rubygems"
require "twitter"
require "google_drive"


#recuperation de la liste des communes via le google drive
def get_city

	session = GoogleDrive::Session.from_config("config.json")
	ws = session.spreadsheet_by_key("1cMn78fjMDMmt8BIENpq0sjPeNASopj50wwUKSXDqs5s").worksheets[0]

	array = []
	(2..ws.num_rows).each do |row|
	    array << ws[row, 1]
	end
	return array
end

def get_twitter(get_city)

	client = Twitter::Streaming::Client.new do |config|
	  config.consumer_key        = "Yn6Id1PvHlbdv3cNall3EcKG4V"
	  config.consumer_secret     = "P8buSS6VSdN7n8JkSRftNd4mPl4t1wvKG8t2RFh4GGPP2ehyZR"
	  config.access_token        = "984020868560031745-wCcd2semPNEixFrO5LOylKeOyuQHJh9"
	  config.access_token_secret = "6MR9ZWnlRvJAaw4v42lQsqfeTNesV5ouaH7rSwezV9amY"
	end

	get_city.each do |info|
		topics = info
		client.filter(track: topics) do |object|
  			puts object.text if object.is_a?(Twitter::Tweet)
		end
	end


end

get_twitter(get_city)

