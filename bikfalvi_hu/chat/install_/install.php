<?php
/*
+---------------------------------------------------------------+
|	Bikfalvi chatbox system
|
|	http://www.bikfalvi.hu
|	bikfalvi.tamas@bikfalvi.hu
|
+---------------------------------------------------------------+
*/

$self = 'http://'.$_SERVER['SERVER_NAME'].$_SERVER['PHP_SELF'];
$path_parts = pathinfo($self);
$fullpath = $path_parts['dirname'].'/';

include_once( 'globals.php' );

parse_str( $_SERVER['QUERY_STRING'] );

$caption = 'Bikfalvi Chat system';
$text = '';

$install_step = 1;
$sql_database = '';
$sql_username = '';
$sql_userpsw = '';

if( isset($_POST['install_step']) )
{
  $install_step = $_POST['install_step'];
  $sql_database = $_POST['sql_database'];
  $sql_username = $_POST['sql_username'];
  $sql_userpsw = $_POST['sql_userpsw'];
}

switch( $install_step )
{
  case '1':
    /***********************************************
    * This is the first step of the install process
    * getting sql connection info
    ***********************************************/
    
    $caption = 'Bikfalvi Chat rendszer - telep�t�s - 1. l�p�s';

    $text .= '
      A chatbox rendszer SQL alap�, ez�rt els� l�p�sk�nt meg kell adni az SQL adatb�zishoz val� hozz�f�r�s adatait.
      <p>
      <form id="install_step1" action="'.$self.'" method="post" name="install_step1">
        <div class="group">
          <div class="groupname">SQL adatb�zis neve:</div>
          <div class="groupvalue">
            <input type="text" name="sql_database" size="30">
          </div>
        </div>
        <div class="group">
          <div class="groupname">SQL felhaszn�l�i n�v:</div>
          <div class="groupvalue">
            <input type="text" name="sql_username" size="20">
          </div>
        </div>
        <div class="group">
          <div class="groupname">SQL felhaszn�l�i jelsz�:</div>
          <div class="groupvalue">
            <input type="Password" name="sql_userpsw" size="20">
          </div>
        </div>
        <input type="hidden" name="install_step" value="2">
        <input type="Submit" name="btn_install_next" value=">> K�vetkez� >>" class="button">
      </form>    
    ';
    break;

  case '2':
    /***********************************************
    * This is the second step of the install process
    * creating sql connection file
    * create sql table    
    ***********************************************/
    
    $caption = 'Bikfalvi Chat rendszer - telep�t�s - 2. l�p�s';

    $sql_config_file = fnCreateConfigStr( $sql_username, $sql_userpsw, $sql_database );
    
    $file = fopen( '../adatbazis.inc.php', 'w+' );
    if( $file != false )
    {
      fputs( $file, $sql_config_file );
      fclose( $file );

      $text .= '
        A be�ll�t�sokat elmentett�k.<br>
      ';
      
      include_once( '../adatbazis.inc.php' );
      
      if( fnCheckSQLConnection( $mySQLserver, $mySQLuser, $mySQLpassword, $mySQLdefaultdb ) == true )
      {
        $text .= '
          Az SQL kapcsolat rendben.<br>
        ';
        
        if( fnCreateSQLTable( $mySQLserver, $mySQLuser, $mySQLpassword, $mySQLdefaultdb ) )
        {
          $text .= '
            Az SQL t�bl�t sikeresen l�trehoztuk.<br>
            <form id="install_step2" action="'.$self.'" method="post" name="install_step2">
              <input type="hidden" name="install_step" value="3">
              <input type="Submit" name="btn_install_next" value=">> K�vetkez� >>" class="button">
            </form>    
          ';
        }
        else
        {
          $text .= '
            Nem siker�lt l�trehozni az SQL t�bl�t. K�rj�k ellen�rizze, hogy rendelkezik-e megfelel� jogosults�gokkal.<br>
          ';
        }
      }
      else
      {
        $text .= '
          Nem siker�lt l�trehozni az SQL kapcsolatot. K�rj�k ellen�rizze a be�ll�tott �rt�keket.<br>
          <a href="'.$self.'">Vissza az el�z� oldalra</a>
        ';
      }
    }
    else
    {
      $text .= '
        Hiba a be�ll�t�sok elment�sekor. K�rj�k pr�b�lkozz �jra, vagy ellen�rizd, hogy rendelkezel-e a megfelel� jogosults�gokkal.
      ';
    }
    break;
  case '3':
    /***********************************************
    * This is the third step of the install process
    ***********************************************/
    
    $caption = 'Bikfalvi Chat rendszer - telep�t�s - 3. l�p�s';
    
    $text .= '
      A telep�t�s befejez�d�tt. K�rj�k t�r�lje MOST az install k�nyvt�rat.
      <p>
      Ugr�s a <a href="../index.php">chatbox</a>-ra.
    ';
    break;
}

fnShowPage( $caption, $text );

?>
