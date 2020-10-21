<?php

$GLOBALS['menu'] = '
  <div id="bikmenu">
    <ul>
';

$GLOBALS['menu'] .= '
  <li><a href="index.php'.$GLOBALS['settings'].'">'.MENU_MAINPAGE.'</a></li>
  <li><a href="news.php'.$GLOBALS['settings'].'">'.MENU_NEWS.'</a></li>
  <li><a href="#'.$GLOBALS['settings'].'">'.MENU_HOMELAND.'</a>
    <ul>
      <li><a href="wiki/index.php'.$GLOBALS['settings'].'">'.MENU_BIKWIKI.'</a></li>
      <li><a href="bikfalva.php'.$GLOBALS['settings'].'">'.MENU_BIKFALVA.'</a></li>
      <li><a href="bikfalvifalkasamuel.php'.$GLOBALS['settings'].'">'.MENU_BIKFALVIOSOK.'</a></li>
    </ul>
  </li>
  <li><a href="galeria.php'.$GLOBALS['settings'].'">'.MENU_GALERY.'</a></li>
';

if( isset($_SESSION['current_user']) )
{
  $GLOBALS['menu'] .= '
    <li><a href="#">'.MENU_SETTINGS.'</a>
      <ul>
        <li><a href="usr_settings.php'.$GLOBALS['settings'].'">'.MENU_USERSETTINGS.'</a></li>
      </ul>
    </li>
  ';
  db_connect();
  if( db_IsAdmin( $_SESSION['USERID'] ) )
  {
    $GLOBALS['menu'] .= '
      <li><a href="admin.php'.$GLOBALS['settings'].'">'.MENU_ADMIN.'</a>
        <ul>
    ';
    if( db_IsAdminRoot( $_SESSION['USERID'] ) )
    {
      $GLOBALS['menu'] .= '
          <li><a href="adm_users.php'.$GLOBALS['settings'].'">'.MENU_USERS.'</a></li>
      ';
    }
    if( db_IsAdminNews( $_SESSION['USERID'] ) )
    {
      $GLOBALS['menu'] .= '
          <li><a href="adm_news.php'.$GLOBALS['settings'].'">'.MENU_NEWS.'</a></li>
      ';
    }
    $GLOBALS['menu'] .= '
        </ul>
      </li>
    ';
  }
  db_close();
}
else
{
  $GLOBALS['menu'] .= '
    <li><a href="usr_registration.php'.$GLOBALS['settings'].'">'.LOGIN_REGISTRATION.'</a></li>
  ';
}

$GLOBALS['menu'] .= '
    </ul>
  </div>
';

?>
