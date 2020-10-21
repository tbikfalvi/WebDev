<?php
/*
+---------------------------------------------------------------+
|	Bikfalvi PHP keretrendszer
|
|	http://www.bikfalvi.hu
|	bikfalvi.tamas@bikfalvi.hu
|
+---------------------------------------------------------------+
*/
include_once( 'bikfalvi.php' );

$caption = PAGE_CAPTION_ADMIN;
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
