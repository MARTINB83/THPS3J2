
require 'twitter'



client = Twitter::Streaming::Client.new do |config|
	  config.consumer_key        = "Yn6Id1PvHlbdv3cNall3EcKG4V"
	  config.consumer_secret     = "P8buSS6VSdN7n8JkSRftNd4mPl4t1wvKG8t2RFh4GGPP2ehyZR"
	  config.access_token        = "984020868560031745-wCcd2semPNEixFrO5LOylKeOyuQHJh9"
	  config.access_token_secret = "6MR9ZWnlRvJAaw4v42lQsqfeTNesV5ouaH7rSwezV9amY"
	end

	topics = ["coffee", "tea"]
client.filter(track: topics.join(",")) do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
end