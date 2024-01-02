#/bin/bash
# variable d'environnement pour utilisation dans les scripts php
set '$bdd' '$url' '$_SERVER' '$path' '$host' '$database' '$login' '$password' '$paths' '$class' '$file' '$navbar' '$title' '$content' '$footer' '$error' '$js' '$css' '$homeController' '$_SESSION' '$value'
# Configuration du projet
echo "1-Saisir le nom de votre projet" 
read directory
echo "le nom est du projet est : "${directory^^}
echo "2-Saisir le nom de votre base de données"
read database
echo "le nom de la base de données est : "${database^^}
echo "3-Saisir le nom de votre utilisateur base de données"
read userDb
echo "le nom de votre utilisateur de base de données est : "${userDb^^}
echo "4-Saisir le mot de passe de votre base de données"
read mdpUser
echo "le mot de passe de la base de données est : "${mdpUser^^}
echo "5-Saisir l'hote du serveur (Exemple => localhost)"
read host
echo "l'hote du serveur de base de données est : "${host^^}
echo "6-Saisir le chemin de votre dossier web (Exemple => c:xampp/htdocs )"
read env
echo "Le chemin de votre dossier web est : "${env^^}
cd $env
# test si le dossier existe déja
if [ -d $directory ]
then
echo "le répertoire existe déja"
# test sinon on génére le projet
else
# Création des répertoires
mkdir $directory
mkdir "$directory/Public/" "$directory/App/"
mkdir "$directory/Public/asset" "$directory/Public/asset/images" "$directory/Public/asset/script" "$directory/Public/asset/style"
mkdir "$directory/App/Utils" "$directory/App/Model" "$directory/App/Manager" "$directory/App/Vue" "$directory/App/Controller"
# Création fichier htaccess
echo "# Activation du rewrite des URL
RewriteEngine On
# base du projet (emplacement à partir de la racine du serveur)
RewriteBase /$directory
# si ce n'est pas un répertoire
RewriteCond %{REQUEST_FILENAME} !-d
# Si ce n'est pas un fichier
RewriteCond %{REQUEST_FILENAME} !-f
RewriteRule ^(.+)$ index.php [QSA,L]">>$directory/.htaccess
# Création du fichier de configuration BDD
echo "<?php
    $5= '$host';
    $6 = '$database';
    $7= '$userDb';
    $8 = '$mdpUser';
?>">>$directory/env.php
# Création classe de connexion BDD
echo "<?php
    namespace App\Utils;
    class BddConnect{
        //fonction connexion BDD
        public function connexion(){
            //retour de l'objet PDO
            return new \PDO('mysql:host='.$5.';dbname='.$6.'', $7, $8, 
            array(\PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION));
}}?>">>$directory/App/Utils/BddConnect.php
# Création du fichier composer.json
echo "{
    \"name\": \"test/${directory}\",
    \"type\": \"project\",
    \"autoload\": {
        \"psr-4\": {
            \"App\\\\\": \"App/\"
        }
    }
}">>$directory/composer.json
# Création du router
echo "<?php
    require_once './env.php';
    //import de l'autoloader des classes
    require_once './vendor/autoload.php';
    use App\Controller\HomeController;
    ${19} = new HomeController();
    //utilisation de session_start(pour gérer la connexion au serveur)
    session_start();
    //Analyse de l'URL avec parse_url() et retourne ses composants
    $2 = parse_url($3['REQUEST_URI']);
    //test si l'url posséde une route sinon on renvoi à la racine
    $4 = isset($2['path']) ? $2['path'] : '/';
    //routeur
    switch ($4) {
        case '/$directory/':
            ${19}->getHome();
            break;
        default:
            ${19}->get404();
            break;
    }
?>">>$directory/index.php
# Création du template
echo "<?php ob_start()?>
<ul>
    <li>Contact</li>
    <li>Conditions générales</li>
    <li>Aide</li>
</ul>
<?php ${15} = ob_get_clean()?>">>$directory/App/Vue/footer.php
echo "<?php ob_start()?>
<?php if(isset(${20}['connected'])):?>
<ul>
    <li><a href="./">Accueil</a></li>
</ul>
<?php else:?>
<ul>
    <li><a href="./">Accueil</a></li>
</ul>
<?php endif;?>
<?php ${12} = ob_get_clean()?>">>$directory/App/Vue/navbar.php
echo "<?php ob_start()?>
    <h1>Erreur 404 la page n'existe pas</h1>
<?php ${14} = ob_get_clean()?>">>$directory/App/Vue/vueError.php
echo "<?php ob_start()?>
    <h1>Page d'Accueil</h1>
<?php ${14} = ob_get_clean()?>">>$directory/App/Vue/vueHome.php
echo "<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php foreach (${18} as ${21}):?>
    <link rel="stylesheet" href="./Public/asset/style/\<?=${21}\?\>">
    <?php endforeach ?>
    <?php foreach (${17} as ${21}):?>
    <script src="./Public/asset/script/\<?=${21}\?\>" async></script>
    <?php endforeach ?>
    <title><?=${13}?></title>
</head>
<body>
    <?=${12}?>
    <?=${14}?>
    <?=${15}?>
</body>
</html>">>$directory/App/Vue/vueTemplate.php
# Création de la classe Template
echo "<?php
namespace App\vue;
class Template{
    public static function render(${12},${13},${14},${15},${16}, array ${17}, array ${18})
    {
        if(file_exists('./App/Vue/'.${14})){
            include './App/Vue/'.${12};
            include './App/Vue/'.${15};
            include './App/Vue/'.${14};
        }
        else{
            ${12} = '';
            ${15} = '';
            ${13} = 'Error 404';
            include './App/Vue/vueError.php';
        }
        include './App/Vue/vueTemplate.php';
    }
}
?>
">>$directory/App/Vue/Template.php
# Création du HomeController
echo "<?php
namespace App\Controller;
use App\vue\Template;
class HomeController{
    public function getHome(){
        ${16} = '';
        Template::render('navbar.php', 'Accueil', 'vueHome.php', 'footer.php', 
        ${16}, ['script.js', 'main.js'], ['style.css', 'main.css']);
    }
    public function get404(){
        ${16} = '';
        Template::render('navbar.php', 'Error 404', 'vueError.php', 'footer.php', 
        ${16}, ['script.js'], ['style.css']);
    }
}
?>
">>$directory/App/Controller/HomeController.php
# Création des fichiers asset
touch $directory/Public/asset/script/script.js 
touch $directory/Public/asset/script/main.js 
touch $directory/Public/asset/style/style.css
touch $directory/Public/asset/style/main.css
echo "Votre projet a été créé"
cd $directory
composer install
echo "composer install ok"
fi
