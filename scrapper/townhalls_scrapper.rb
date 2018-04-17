require "google_drive"
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

#methode de recuperation des infos pour chaque mairie
def mairie (lien_mairie)
  mairie_page = Nokogiri::HTML(open(lien_mairie))
  mairie_info = mairie_page.css("div[1]/main/section[1]/div/div/div/h1").text.split(" - ") 
  name = mairie_info[0]
  dept = mairie_page.css('/html/body/div/main/section[4]/div/table/tbody/tr[1]/td[2]').text
  email = mairie_page.css("div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]").text
  h = Hash[:name => name, :email => email, :dept => dept]
  return h
end

#methode d'envoi dans le fichier Google Drive
def send_to_spreadsheet (hash_array)

#initialisation du spreadsheet
  session = GoogleDrive::Session.from_config("../config.json")
  ws = session.spreadsheet_by_key("1cMn78fjMDMmt8BIENpq0sjPeNASopj50wwUKSXDqs5s").worksheets[0]
#recuperation des données
  ws[1, 1] = "Mairie"
  ws[1, 2] = "Email"
  ws[1, 3] = "Département"

  i = 2 # car la premiere ligne contient les titres, les infos commencent à la ligne 2
  hash_array.each do |x|
    ws[i, 1] = x[:name]
    ws[i, 2] = x[:email]
    ws[i, 3] = x[:dept]
    ws.save # permet de modifier et d'enregistrer le spreadsheet
    i += 1 # permet de passesr à la ligne suivante
  end
end

#methode pour recuperer chaque lien
def scan_list_mairie (lien)
#initialisation des données
  url_origin = "http://annuaire-des-mairies.com/"
  list_mairie = []
  page_origin = Nokogiri::HTML(open(lien))
  mairie_link = page_origin.css('a.lientxt')
#boucle pour recuperer chaque lien
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

#lance la methode
perform