## Présentation du script :
Ce script bash permet de générer une base de projet PHP MVC MySQL
## Prés-requis : 
Environnement terminal bash (git bash),
Windows,
Environnement Apache, PHP 8+, MySQL
## Utilisation du script :
1. Ouvrir votre terminal bash (git bash) dans le répertoire de votre script,
2. Lancer le script avec la commande :
```
bash script4.sh
```
3. Répondre aux questions du script :
Nom du projet, nom de la base de données, identifiant BDD, mot de passe BDD, emplacement du répertoire Environnement(localhost), répertoire web Apache.
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

	-> Répertoire images (fichier images),

	-> Répertoire script (fichier script JS),

	-> Répertoire style (fichier style CSS),

fichiers :

	-> env.php (fichier de configuration BDD),

	-> autoload.php (fichier autoloader classe),

	-> index.php (fichier router),

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

	-> autoload.php (configuration du fichier d'autochargement des classes),

	-> index.php (configuration du router avec la configuration du projet),

	-> .htaccess (configuration du fichier de configuration Apache).
