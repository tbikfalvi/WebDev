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

$caption = PAGE_CAPTION_USER_SETTINGS;
$text = '';

/****************************************************************
* Jogosultság ellenõrzés
*****************************************************************/

if( !isset($_SESSION['USERID']) )
{
  echo '<script>location.replace("index.php"); </script>';
}

/****************************************************************
* Form paraméterek
*****************************************************************/

$formtype = 'new';	
$error_message = '';
$success_message = '';

$form = '';
if( isset($_POST['user_jelszo_valtoztatas']) )  $form = 'newpassword';
if( isset($_POST['user_alap_adatok']) )         $form = 'maindatamod';

$pswold          = $_POST['user_jelszo1'];
$pswnew1         = $_POST['user_jelszo2'];
$pswnew2         = $_POST['user_jelszo3'];
$user_login      = $_POST['user_1'];
$user_displ      = $_POST['user_3'];
$user_email      = $_POST['user_4'];

/**************************************************************
* Form-ok feldolgozása
**************************************************************/

if( $form == 'newpassword' )
{
  db_connect();
  $user_password = db_GetUserPassword( $_SESSION['USERID'] );
  db_close();
  $old_password  = md5( $pswold );

  if( $user_password != $old_password )
  {
    $error_message = ERROR_WRONG_OLD_PASSWORD;
  }
  else
  {
    if( $pswnew1 != $pswnew2 || $pswnew1 == '' || $pswnew2 == '' )
    {
      $error_message = ERROR_DIFFERENT_PASSWORD_RETYPE;
    }
    else
    {
      $ret = FALSE;

      db_connect();
      $ret = db_SetUserPassword( $_SESSION['USERID'], $pswnew1 );
      db_close();
      
      if( $ret )
      {
        $success_message = INFO_PASSWORD_CHANGED;
      }
      else
      {
        $error_message = ERROR_SQL_UNABLE_TO_CHANGE_PASSWORD;
      }
    }
  }
}
else if( $form == 'maindatamod' )
{
  $iserror = FALSE;

  if( $user_login == '' )
  {
    $iserror = TRUE;
    $error_message .= ERROR_LOGIN_NOT_DEFINED;
  }  
  if( $user_displ == '' )
  {
    $iserror = TRUE;
    $error_message .= ERROR_DISPLAY_NOT_DEFINED;
  }  
  if( $user_email == '' )
  {
    $iserror = TRUE;
    $error_message .= ERROR_EMAIL_NOT_DEFINED;
  }  
  db_connect();
  if( ($sql = db_UserGet( '', 'usr_login="'.$user_login.'" AND usr_id!="'.$_SESSION['USERID'].'"' )) != FALSE )
  {
    if( $row = db_ReadNextRow( $sql ) )
    {
      $iserror = TRUE;
      $error_message .= ERROR_LOGIN_ALREADY_USED;
    }
  }
  if( ($sql = db_UserGet( '', 'usr_mail="'.$user_email.'" AND usr_id!="'.$_SESSION['USERID'].'"' )) != FALSE )
  {
    if( $row = db_ReadNextRow( $sql ) )
    {
      $iserror = TRUE;
      $error_message .= ERROR_MAIL_ALREADY_USED;
    }
  }
  db_close();

  if( !$iserror )
  {
    db_connect();
    $ret = db_UserMainDataMod( $user_login, $user_displ, $user_email, $_SESSION['USERID'] );
    db_close();
    if( $ret )
      $success_message = INFO_DATABASE_UPDATED;
    else
      $error_message = ERROR_SQL_UNABLE_TO_UPDATE_DATA;
  }
}
else if( $form == '' )
{
  db_connect();
  if( ($sql = db_UserGet( '', 'usr_id="'.$_SESSION['USERID'].'"' )) != FALSE )
  {
    $row = db_ReadNextRow( $sql );
    $user_login = $row['usr_login'];
    $user_displ = $row['usr_display'];
    $user_email = $row['usr_mail'];
  }
  db_close();
}

/****************************************************************
* If any error occured, display error message
*****************************************************************/
if( $error_message != '' )
{
  $text .= '
    <div class="error_group">'.$error_message.'</div>
  ';
}

/****************************************************************
* If form process succeeded, display success message
*****************************************************************/
else if( $success_message != '' )
{
  $text .= '
    <div class="success_group">'.$success_message.'</div>
  ';
}	

/**************************************************************
* Oldal megjelenítése
**************************************************************/

/***** Belépési adatok megváltoztatása ***********************/
$text .= '
  <div class="form_group">
    <span class="form_group_span">'.TITLE_TEXT_LOGIN_DATA.'</span>
    
      <form action="'.$GLOBALS['self'].'" method="post">
        <div class="group">
          <div class="groupname">'.FORM_TEXT_LOGIN_NAME.':</div>
          <div class="groupvalue"><input type="text" name="user_1" value="'.$user_login.'" size="30">
          </div>
        </div>
        <div class="group">
          <div class="groupname">'.FORM_TEXT_DISPLAY_NAME.':</div>
          <div class="groupvalue"><input type="text" name="user_3" value="'.$user_displ.'" size="30">
          </div>
        </div>
        <div class="group">
          <div class="groupname">'.FORM_TEXT_EMAIL.':</div>
          <div class="groupvalue"><input type="text" name="user_4" value="'.$user_email.'" size="30">
          </div>
        </div>
        <div class="group">
          <div class="groupname"><input type="Submit" name="user_alap_adatok" value="'.BTN_OK.'" class="button"></div>
        </div>
      </form>
     
  </div>
';

/***** Jelszó megváltoztatása ********************************/
$text .= '
  <div class="form_group">
    <span class="form_group_span">'.TITLE_TEXT_NEW_PASSWORD.'</span>
    
      <form action="'.$GLOBALS['self'].'" method="post">
        <div class="group">
          <div class="groupname">'.FORM_TEXT_PASSWORD_OLD.':</div>
          <div class="groupvalue"><input type="password" name="user_jelszo1" value="" size="30">
          </div>
        </div>
        <div class="group">
          <div class="groupname">'.FORM_TEXT_PASSWORD_NEW.':</div>
          <div class="groupvalue"><input type="password" name="user_jelszo2" value="" size="30"></div>
        </div>
        <div class="group">
          <div class="groupname">'.FORM_TEXT_PASSWORD_NEW_RETYPE.':</div>
          <div class="groupvalue"><input type="password" name="user_jelszo3" value="" size="30"></div>
        </div>
        <div class="group">
          <div class="groupname"><input type="Submit" name="user_jelszo_valtoztatas" value="'.BTN_OK.'" class="button"></div>
        </div>
      </form>
     
  </div>
';

fnShowPage( $caption, $text );

?>
