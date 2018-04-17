require "rubygems"
require "twitter"
require "google_drive"

client = Twitter::REST::Client.new do |config|
session = GoogleDrive::Session.from_config("config.json")  
config.consumer_key        = "n6Id1PvHlbdv3cNall3EcKG4V"
 config.consumer_secret     = "P8buSS6VSdN7n8JkSRftNd4mPl4t1wvKG8t2RFh4GGPP2ehyZR"
 config.access_token        = "984020868560031745-wCcd2semPNEixFrO5LOylKeOyuQHJh9"
 config.access_token_secret = "6MR9ZWnlRvJAaw4v42lQsqfeTNesV5ouaH7rSwezV9amY"
end
ws = session.spreadsheet_by_key("1BMNnvNtXQ2xa6DGo8gFdsGFVos_iyuHUAGOsFWRAINk").worksheets[0]
p clientspreadsheet[gid,range] 
# gid = ordonnée , range = abscisse# cette boucle n'est pas bonne comme tu peux le voir  ws.each do |user|
   client.follow("#{user}")
 end  # peut etre un truc du genre =  i = gid + 1
spreadsheet.each do | x|
 spreadsheet + i  client.follow()
end

ws[i, 4] = handletwitter