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
    
    $caption = 'Bikfalvi Chat rendszer - telepítés - 1. lépés';

    $text .= '
      A chatbox rendszer SQL alapú, ezért elsõ lépésként meg kell adni az SQL adatbázishoz való hozzáférés adatait.
      <p>
      <form id="install_step1" action="'.$self.'" method="post" name="install_step1">
        <div class="group">
          <div class="groupname">SQL adatbázis neve:</div>
          <div class="groupvalue">
            <input type="text" name="sql_database" size="30">
          </div>
        </div>
        <div class="group">
          <div class="groupname">SQL felhasználói név:</div>
          <div class="groupvalue">
            <input type="text" name="sql_username" size="20">
          </div>
        </div>
        <div class="group">
          <div class="groupname">SQL felhasználói jelszó:</div>
          <div class="groupvalue">
            <input type="Password" name="sql_userpsw" size="20">
          </div>
        </div>
        <input type="hidden" name="install_step" value="2">
        <input type="Submit" name="btn_install_next" value=">> Következõ >>" class="button">
      </form>    
    ';
    break;

  case '2':
    /***********************************************
    * This is the second step of the install process
    * creating sql connection file
    * create sql table    
    ***********************************************/
    
    $caption = 'Bikfalvi Chat rendszer - telepítés - 2. lépés';

    $sql_config_file = fnCreateConfigStr( $sql_username, $sql_userpsw, $sql_database );
    
    $file = fopen( '../adatbazis.inc.php', 'w+' );
    if( $file != false )
    {
      fputs( $file, $sql_config_file );
      fclose( $file );

      $text .= '
        A beállításokat elmentettük.<br>
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
            Az SQL táblát sikeresen létrehoztuk.<br>
            <form id="install_step2" action="'.$self.'" method="post" name="install_step2">
              <input type="hidden" name="install_step" value="3">
              <input type="Submit" name="btn_install_next" value=">> Következõ >>" class="button">
            </form>    
          ';
        }
        else
        {
          $text .= '
            Nem sikerült létrehozni az SQL táblát. Kérjük ellenõrizze, hogy rendelkezik-e megfelelõ jogosultságokkal.<br>
          ';
        }
      }
      else
      {
        $text .= '
          Nem sikerült létrehozni az SQL kapcsolatot. Kérjük ellenõrizze a beállított értékeket.<br>
          <a href="'.$self.'">Vissza az elõzõ oldalra</a>
        ';
      }
    }
    else
    {
      $text .= '
        Hiba a beállítások elmentésekor. Kérjük próbálkozz újra, vagy ellenõrizd, hogy rendelkezel-e a megfelelõ jogosultságokkal.
      ';
    }
    break;
  case '3':
    /***********************************************
    * This is the third step of the install process
    ***********************************************/
    
    $caption = 'Bikfalvi Chat rendszer - telepítés - 3. lépés';
    
    $text .= '
      A telepítés befejezõdött. Kérjük törölje MOST az install könyvtárat.
      <p>
      Ugrás a <a href="../index.php">chatbox</a>-ra.
    ';
    break;
}

fnShowPage( $caption, $text );

?>
