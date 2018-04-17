# EXERCICE SEMAINE 3 - JOUR 3

-------------

### Introduction : Présentation de l'équipe (@pseudo_slack)
- Raouf (@raouf)
- Manu (@tinoun)
- Youcef (@youcef)
- Berangere (@ekkhi)

-------------

### Utilisation du bundle

Tout d'abord, clone ce projet dans ton dossier.
Ouvre ton Terminal, et place toi dans le dossier cloné.

Tape : `bundle install` dans ton Terminal.
Cela te permettra d'installer les gems necessaires à l'execution du programme.

Si tu as un message d'erreur, essaie `rvm install 2.5.1`.
ou encore `gem update`

Si tu as (encore) un message d'erreur, *n'hésites pas à nous contacter!*

------------

### Arborescence du projet

Dossier **mailer**
- Fichier : *townhalls_mailer.rb* => Permet d'envoyer les mails à chaque mairie **A LANCER**

Dossier **scrapper**
- Fichier : *townhalls_scrapper.rb* => Permet de recuperer les données **A LANCER**

Dossier **twitter**
- Fichier : *townhalls_adder_to_db.rb* => Permet de follow sur Twitter **NON VALIDE**



- Fichier **README.md** : Retrouve ici toutes les informations dont tu as besoin
- Fichier **Gemfile** : Ici se trouve toute les gems dont tu as besoin
- Fichier **config.json** : Fichier à renseigner avec tes propres cles

------------

### Utilisation du programme

- En premier lieu renseignes ton config.json
- Va dans le dossier **scrapper**
- Ensuite lance le programme **townhalls_scrapper.rb** , il va recuperer les données utiles et les intégrer à la feuille de calcul : [vas voir ici](https://docs.google.com/spreadsheets/d/1cMn78fjMDMmt8BIENpq0sjPeNASopj50wwUKSXDqs5s/edit#gid=0).

- Reviens dans la console et va ensuite dans le dossier **mailer**
- Lance le programme **townhalls_mailer.rb** , il va envoyer un mail à toute les mairies des Bouches du Rhone (13) pour leur faire decouvrir THP **trop cool!!**

- Et VOILAAAAA parce que le bot Twitter, on a pas réussi :(

------------



##Merci pour la correction ! 


![alt tag](https://user-images.githubusercontent.com/37908682/38898586-acc9ed70-4295-11e8-9433-fa83027043be.png)
