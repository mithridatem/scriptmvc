## Présentation du script :
Ce script bash permet de générer une base de projet PHP MVC MySQL
## Prés-requis : 
Environnement terminal bash (git bash),
Windows, Linux,
Environnement Apache, PHP 8 +, MySQL ou MariaDB,
PHP Composer 2.5 +.
## Utilisation du script :
1. Ouvrir votre terminal bash (git bash) dans le répertoire de votre script,
2. Lancer le script avec la commande :
```
bash script5.sh
```
3. Répondre aux questions du script :
	1-Nom du projet,
	2-Nom de la base de données,
	3-Identifiant BDD,
   	4-Mot de passe BDD,
   	5-Emplacement du serveur Environnement(localhost),
   	6-Répertoire www ou htdocs serveur WEB Apache.
## Le script va générer la structure suivante :
Répertoire de base du projet (avec le nom choisi),

	-> Repertoire App (Répertoire source du projet 'src'),

	-> Controller (fichiers classe controller),

	-> Manager (fichiers classe manager),

	-> Model (fichiers classe model),

	-> Service (fichiers classe service),

	-> Utils (fichiers classe utilitaire),

	-> Vue (fichiers classe Template).

	-> Répertoire Public/Asset

	-> Répertoire images (fichiers => images),

	-> Répertoire script (fichiers => script JS),

	-> Répertoire style (fichiers => style CSS),

fichiers :

	-> env.php (fichier de configuration BDD),

	-> index.php (fichier router),

  	-> composer.json (fichier de configuration composer)

	->.htaccess (fichier configuration Apache),

	-> App/Vue/navbar.php (fichier composant navbar),

	-> App/Vue/footer.php (fichier composant footer),

	-> App/Vue/VueHome.php (fichier page accueil),

	-> App/Vue/vueError.php (fichier page d'erreur).

	-> App/Vue/vueTemplate.php (fichier template de base),

	-> App/Vue/Template.php (Classe Template).

	-> App/Utils/BddConnect.php (Classe de connexion à la base de données)

## Configuration des fichiers :
Le script va configurer les fichiers suivants :

	-> env.php (configuration des informations de connexion à la base de données),

	-> composer.json (configuration de composer pour l'autoload des classes),

	-> index.php (configuration du router avec la configuration du projet),

	-> .htaccess (configuration du fichier de configuration Apache).
