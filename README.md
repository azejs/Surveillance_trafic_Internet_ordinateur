## Surveillance du trafic Internet 

Dans ce projet, J'ai créé un script shell très basique qui calcule le trafic réseau et
créera une figure (à l’aide du programme Gnuplot) montrant l’évolution de la quantité de
données reçues et envoyées par notre carte réseau. Cette figure sera montrée par le biais
d’une page HTML statique qui se mettra à jour régulier et automatiquement.                

## Création un script pour calculer les Octets Entrants et Sortants

d'abord j'ai créé un script shell qui prend en argument le nom de l'interface réseau à surveiller, 
puis a utilisé  des commandes pour récupérer les statistiques de trafic de cette interface. Ces statistiques 
sont étés obtenues en accédant aux fichiers dans le système /sys/class/net/$netiface/statistics/
où $netiface est le nom de l'interface réseau.  ensuite ,à l’aide du programme Gnuplot j'ai obetnu une graphique
représentant l'évolution du trafic en entrée et en sortie, sur une période maximale d'une heure.
j'ai utilisé cette methode pour résumer et facilter les tâches,

## Gnuplot 
permet d'inclure facilement des tracés d'aspect professionnel dans notre documents. Pour ce faire, on va  définir notre terminal gnuplot :

## Création la page HTML Template

Pour mettre à jour automatiquement la page HTML contenant le graphique, je peux utiliser la balise meta avec le paramètre http-equiv="refresh". La page HTML contient les  informations sur l'interface surveillée et a été enregistrée par défaut dans le dossier /tmp/netiface, où netiface correspond au nom de l'interface à surveiller.

## Explication 
j'ai crée une boucle 'for' pour collecter des statistiques sur le trafic réseau pour une interface spécifique (ens33) toutes les 60 secondes pour un total de 60 itérations. Il crée deux fichiers (entrant.rx et sortant.tx) dans le répertoire ~/Documents/projet pour stocker respectivement les octets reçus et transmis. Il crée également un fichier (minutes) pour stocker l'itération en cours. Après chaque itération, le script dort pendant 60 secondes avant de continuer. Enfin, le script colle les fichiers minutes, entrant.rx et sortant.tx ensemble et enregistre la sortie dans un fichier appelé netiface.sh dans le répertoire /tmp/netiface.
## Execution 
### 1- `ls -l et` et `chmod +x proTrafic.sh` Pour vérifier les droits d'accès (les informations de permission), en cas s'il n'existe pas le droit à l'execution , on va ajouter deuxième commande.  
### 2 - `bash -x proTrafic.sh` executer le script via la commande  le script aura  généré automatiquement en créant les autres fichiers
### 3 - `cat /tmp/netiface | netiface` cette commande pour vérifier les fichiers s'ils ont été crée ou non 
### 4- `lynx netiface.html.`  lancer la page html statique pour afficher le résulat a chaque 5 seconds en fait la mis à jour



### `<<La philosophie de Linux est  Rire face à un danger . Oups. Ce n'est pas le bon  Faites-le vous-même>> `. 

 
