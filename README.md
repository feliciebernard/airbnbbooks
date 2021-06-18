# README

## 1. Présentation
Nous pouvons observer que très souvent nous prêtons des livres ou en empruntons et, quelques mois après, nous ne savons plus à qui et où ils sont ! 😰  &nbsp; Ou alors, parfois nous cherchons un livre qui n'est plus en vente et n'avons aucune idée qu'un ami, une connaissance, l'a en sa possession, en train de prendre la poussière dans la bibliothèque. 🤓 <br>
Et si nous développions une application qui permettrait de mettre en relation les personnes qui possèdent des livres et ceux qui cherchent à les emprunter ? Une application qui permettrait d'enregistrer toute sa bibliothèque grâce au ISBN (code-barre) des livres et qui permettrait de savoir à qui nous avons prêter ou emprunté ce livre ? 🤩

## 2. Parcours utilisateur
L'utilisateur est à la fois la personne qui emprunte et/ou qui prête ses livres. Cette personne, une fois inscrite, aura accès à une interface où elle pourra consulter les livres que d'autres personnes ont dans leur bibliothèque ou ajouter des livres empruntables. 
Elle pourra même y mettre un avis, une appréciation (lui permettant par la même occasion de se souvenir de tel ou tel livre). 
Chaque utilisateur pourra échanger et se mettre d'accord pour l'emprunt du livre.

## 3. Concrètement et techniquement
La structure de base peut être très simple, basique : un <code>User</code> qui indiquerait ses coordonnées, présenterait (s'il a des livres à prêter) ses <code>OwnBooks</code>. 
Pour entrer un <code>OwnBook</code>, l'<code>User</code> regardera si la fiche du livre apparait déjà sur l'app, sinon il devra entrer les informations du livre : l'ISBN, le titre, le résumé, le genre et une photo. Il entrera ensuite une appréciation, un commentaire dessus.
Les <code>OwnBook</code> seront accessibles sur un index qu'il sera possible de trier par ville, ainsi que sur la page profil de chaque User.
Un <code>User</code> pourra se mettre en contact au moyen de <code>PrivateMessage</code> auprès d'un autre <code>User</code> afin d'échanger sur le livre et se mettre d'accord pour l'emprunt.
L'<code>User</code> pourra voir sur la page du livre s'il est emprunté ou non, la date de l'emprunt et l'identité de la personne qui l'a empruntée.

Si cette première base fonctionne, il sera intéressant de l'élargir avec d'autres objets, comme les albums de musique (CD ou vinyles), vêtements spéciaux (déguisement, costard, vêtement de bébé, de ski...), matériels de bricolage ou autre.
A l'exception que ce site est fait pour vendre, nous pourrions nous en inspirer pour créer l'interface : https://www.chasse-aux-livres.fr/.

### 3.1. Base de données
Fondée sur PostreSQL, la base de données stockera les informations sur les utilisateurs (<code>User</code>), leurs livres (<code>OwnBook</code>); ainsi que leurs messages (<code>PrivateMEssage</code>)

### 3.2. Front
Le front sera construit à partir d'un kit UI personnalisé, construit autour de l'univers du livre. Boutons, formulaires et listes seront au rendez-vous. C'est dans une ambiance confortable, chaleureuse que l'utilisateur sera accueilli. 🥰 

### 3.3. Backend
l'API principale sera celle qui gère l'utilisation des données ISBN, afin d'entrer les livres facilement sur la plateforme, sans créer de doublons avec un autre livre. Les recherches sont encore en cours, mais cette gemfile pourrait faire l'affaire : https://github.com/eftakhairul/gisbn. Ou alors cette API (très limitée ou payante) : https://www.isbndb.com/apidocs/v2
D'autres seront nécessaires, comme :
- Mailer avec Sendgrid
- Cloudinary pour la gestion d'images
- Devise pour les authantifications des utilisateurs
- Dotenv pour stocker les clés API
- autres

### 3.4. Mes besoins techniques
Au moins 4 personnes sont nécessaires afin de  mettre en place le plus beau site d'échange de livres.
- une personne au front : il est important de ne pas négliger le front si on veut que l'application perdure dans le temps et surtout bien accompagner l'utilisateur dans son expérience avec le site.
- deux personnes en backend : le travail pourra être séparer en deux parties : la partie User et authentification, et la partie OwnBook et PrivateMessage
- une personne aux SPEC. Et oui les fameux tests qui nous ont bien pris la tête fut un temps... C'est l'occasion en 💰 &nbsp; ici de les utiliser pour s'assurer que tout fonctionne bien avant de sortir l'app !
- une personne ayant une vue d'ensemble du projet, qui permette de faire le lien entre le font, le end et le spec, afin que tous les éléments puissent coordonner ensemble sans que tout parte en live. Quelques outils seront ainsi à mettre en place afin de s'organiser : un Trello, un Github, une bonne playlist 💃🕺 qui motive et tout et tout

Personnellement je me vois bien à cette dernière place, de coordination, ayant ce projet en tête depuis quelques mois. Mais le backend ainsi que le front ne me dérangent pas non plus :)

## 4. La version minimaliste mais fonctionnelle qu'il faut avoir livré la première semaine
Les gens s'inscrivent sur le site. S'ils s'inscrivent, ils peuvent ajouter leurs livres. Les livres disponibles sont affichés sur la page d'accueil. Sur la fiche du livre, il y a l'adresse mail du propriétaire du livre, afin de le contacter pour emprunter le livre. Une fois le livre emprunté, le propriétaire peut indiquer sur la fiche qu'il est emprunté.

## 5. La version que l'on présentera aux jury
Cette première version pourra être améliorée, par exemple en créant une interface pour s'envoyer des messages privés. Ensuite, grâce à l'API de gestion d'ISBN, le titre et le résumé du livre pourront s'ajouter automatiquement. Il ne restera plus qu'à mettre son avis et une note ! Il faudra également pouvoir ranger les livres par genre ou par ville et ce même si il y a plusieurs villes pour un livre (si plusieurs utilisateurs ont le même livre).
Enfin, on pourra indiquer sur la fiche qui a emprunté le livre, et depuis quand.

## 6. Notre mentor
Rosalie AGUILLON

## 7. Liens

- Parcours Utilisateurs : https://www.figma.com/file/ld6LsdFpMOetNNe1Me1n7V/Parcours-utilisateur-Where-is-my-book?node-id=0%3A1
- Wireframe : https://www.figma.com/file/U05DrNqhepEi7ySf0Nls2O/WIREFRAME-WHEREISMYBOOK
- Trello : https://trello.com/b/yUHoJM1f/where-is-my-book
- Maquette : https://www.figma.com/file/N2MVeJU8oyrKS8Q1vu1Pax/WHEREISMYBOOK-TEMPLATE?node-id=5%3A4
- Et le fameux Heroku : http://where-is-my-book.herokuapp.com/
