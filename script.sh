#/bin/bash
set '$bdd'
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
echo "5-Saisir le chemin de votre dossier web (Exemple => c:xampp/htdocs )"
read env
echo "Le chemin de votre dossier web est : "${env^^}
cd $env
if [ -d $directory ]
then
echo "le répertoire existe déja"
else
mkdir $directory
mkdir "$directory/asset" "$directory/asset/images" "$directory/asset/script" "$directory/asset/style"
mkdir "$directory/utils" "$directory/model" "$directory/manager" "$directory/view"
echo "# Activation du rewrite des URL
RewriteEngine On
# base du projet (emplacement à partir de la racine du serveur\n
RewriteBase /$directory
# si ce n'est pas un répertoire
RewriteCond %{REQUEST_FILENAME} !-d
# Si ce n'est pas un fichier
RewriteCond %{REQUEST_FILENAME} !-f
RewriteRule ^(.+)$ index.php [QSA,L]">>$directory/.htaccess
echo "<?php
   //connexion à la base de données
   $1 = new PDO('mysql:host=localhost;dbname=$database', '$userDb','$mdpDb',
   array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
?>" >>$directory/utils/connectBdd.php
touch c:/xampp2/htdocs/$directory/asset/script/script.js 
touch c:/xampp2/htdocs/$directory/asset/style/style.css
touch c:/xampp2/htdocs/$directory/index.php
echo "Votre projet à été créé"
fi


