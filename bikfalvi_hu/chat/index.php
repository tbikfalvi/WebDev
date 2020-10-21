<?php

if( file_exists('install/install.php') )
{
  if( file_exists('adatbazis.inc.php') )
  {
    header('Location: chat.php');
  }
  else
  {
    header('Location: install/install.php');
  } 
}
else
{
  header('Location: chat.php'); 
}

?>
