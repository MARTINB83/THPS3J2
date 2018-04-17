require "google_drive"
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

#methode de recuperation des infos pour chaque mairie
def mairie (lien_mairie)
  mairie_page = Nokogiri::HTML(open(lien_mairie))
  mairie_info = mairie_page.css("div[1]/main/section[1]/div/div/div/h1").text.split(" - ") #On cherche le H1 et on split pour séparer le nom et le Zip Code
  name = mairie_info[0]
  postal_code = mairie_info[1]
  email = mairie_page.css("div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]").text
  h = Hash[:name => name, :email => email, :postal_code => postal_code]
  return h
end

#methode d'envoi dans le fichier Google Drive
def send_to_spreadsheet (hash_array)
  session = GoogleDrive::Session.from_config("config.json")
  ws = session.spreadsheet_by_key("1cMn78fjMDMmt8BIENpq0sjPeNASopj50wwUKSXDqs5s").worksheets[0]
  ws[1, 1] = "Mairie"
  ws[1, 2] = "Email"
  ws[1, 3] = "Code Postal"
  i = 2
  hash_array.each do |x|
    ws[i, 1] = x[:name]
    ws[i, 2] = x[:email]
    ws[i, 3] = x[:postal_code]
    ws.save
    i += 1
  end
end

#methode pour recuperer chaque lien
def scan_list_mairie (lien)
  url_origin = "http://annuaire-des-mairies.com/"
  list_mairie = []
  page_origin = Nokogiri::HTML(open(lien))
  mairie_link = page_origin.css('a.lientxt')
  mairie_link.each  do |x|
    link = x['href']
    link_to_mairie = URI.join(url_origin, link).to_s
    list_mairie.push(mairie(link_to_mairie))
  end
  #retourne la liste des liens de chaque mairie
return list_mairie
end

#methode principale qui lance les autres methodes utiles
def perform
  url_origin = "http://annuaire-des-mairies.com/bouches-du-rhone.html"
  send_to_spreadsheet(scan_list_mairie(url_origin))
end

perform