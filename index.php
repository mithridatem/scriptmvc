<?php 
  $url = 'https://partytime.adrardev.fr/config/connexion.php'; 
    
  // Initialiser la session cURL
  $session = curl_init($url); 
    
  // Inintialiser le nom de répertoire où le fichier sera sauvegardé
  $dir = './'; 
    
  $file_name = basename($url); 
    
  // Enregistrer le fichier
  $save = $dir . $file_name; 
    
  // Ouvrir le fichier 
  $file = fopen($url, 'r'); 
// fichier de sauvegarde
$file_save = fopen('./connexion.php', 'a+');
  var_dump(file($file));
  //$save = file_put_contents($file_save, $recup);



//   // définit les option pour le transfert
//   curl_setopt($session, CURLOPT_FILE, $file); 
//   curl_setopt($session, CURLOPT_HEADER, 0); 
    
//   curl_exec($session); 
    
//   curl_close($session); 
    
//   fclose($file); 
?>