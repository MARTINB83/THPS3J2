require "rubygems"
require "twitter"
require "google_drive"


#recuperation de la liste des communes via le google drive
def get_city

#initialisation du spreadsheet
	session = GoogleDrive::Session.from_config("../config.json")
	ws = session.spreadsheet_by_key("1J1AkBoW01NpK3-brJgAyGw5pg33g36lAoEXnO12EDxg").worksheets[0]
#initialisation des données
	i = 2
	city = ws[i, 1]
#boucle pour passer sur chaque ligne du spreadsheet
	until ws[i, 1] == ws[129, 1] do
		add_twitter(city)
		i += 1
	end
end

#methode pour follow sur Twitter
def add_twitter(city)

#initialisation des identifiants
	client = Twitter::REST::Client.new do |config|
	  config.consumer_key        = "PUTS YOUR KEY"
	  config.consumer_secret     = "PUTS YOUR KEY"
	  config.access_token        = "PUTS YOUR KEY"
	  config.access_token_secret = "PUTS YOUR KEY"
	end

# FAIL malheureusement nous n'avons pas reussi ... 
	info = client.user_search(city)
	puts city
	info.follow(city)

end

get_city



