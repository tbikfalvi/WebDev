<?php

include_once( 'bikfalvi.php' );

$caption = PAGE_CAPTION_ADMIN_USERS;
$text = '';

/****************************************************************
* Jogosultság ellenõrzés
*****************************************************************/

if( !isset($_SESSION['USERID']) )
{
  echo '<script>location.replace("index.php"); </script>';
}
else
{
  db_connect();
  if( !db_IsAdminRoot( $_SESSION['USERID'] ) )
  {
    echo '<script>location.replace("index.php"); </script>';
  }
  db_close();
}

fnShowPage( $caption, $text );

?>
