require 'gmail'
require 'google_drive'

#methode permettant d'envoyer un mail
def send_mail_to_line(i)

#initialisation du spreadsheet
  session = GoogleDrive::Session.from_config("../config.json")
    ws = session.spreadsheet_by_key("1cMn78fjMDMmt8BIENpq0sjPeNASopj50wwUKSXDqs5s").worksheets[0]
#recuperation des données
    city = ws[i, 1]
    mail = ws[i, 3]

#envoi du mail
    Gmail.connect("thpeastcoast@gmail.com", "raouf13thp") do |gmail|
      gmail.deliver do
        to "#{mail}"

        subject "Venez découvrir The Hacking Project"
        html_part do 
          content_type 'text/html; charset=UTF-8'
          body "<p> Bonjour,</p> <br>
<p>Je suis élève à <strong>The Hacking Project</strong>, une formation au code gratuite,sans locaux, 
sans sélection, sans restriction géographique.</p> 
<p>La pédagogie de notre école est celle du peer-learning, où nous travaillons par petits groupes 
sur des projets concrets qui font apprendre le code.</p>
<p>Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire 
de The Hacking Project un nouveau format d'éducation pour tous.</p>
<p>Déjà 300 personnes sont passées par <strong>The Hacking Project</strong>.
Est-ce que la mairie de #{city} veut changer le monde avec nous ?</p>
<br>
<p>Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80 </p> "
        end
      end
    end
end

#methode permettant de faire une boucle sur les lignes du spreadsheet
def go_through_all_the_lines

#initialisation du spreadsheet
  session = GoogleDrive::Session.from_config("../config.json")
    ws = session.spreadsheet_by_key("1cMn78fjMDMmt8BIENpq0sjPeNASopj50wwUKSXDqs5s").worksheets[0]
  i = 2 # car la premiere ligne nous sert pour les titres , les infos commencent à la ligne 2
#utilisation d'une boucle
  until ws[i, 1] == ws[129, 1] do
    send_mail_to_line(i) #permet d'envoyer l'email au destinataire i
    i += 1 #permet de passer a la ligne suivante
  end
end

#applique la methode
go_through_all_the_lines