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

$caption = PAGE_CAPTION_REGISTRATION;
$text = '';

/****************************************************************
* Jogosultság ellenõrzés
*****************************************************************/

if( isset($_SESSION['USERID']) )
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
if( isset($_POST['user_registration']) ) $form = 'userreg';

$user_login       = $_POST['user_1'];
$user_passw       = $_POST['user_2'];
$user_passr       = $_POST['user_02'];
$user_displ       = $_POST['user_3'];
$user_email       = $_POST['user_4'];

/**************************************************************
* Form-ok feldolgozása
**************************************************************/

if( $form == 'userreg' )
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
  if( $user_passw != $user_passr || $user_passw == '' || $user_passr == '' )
  {
    $iserror = TRUE;
    $error_message .= ERROR_DIFFERENT_PASSWORD_RETYPE;
  }
  db_connect();
  if( ($sql = db_UserGet( '', 'usr_login="'.$user_login.'"' )) != FALSE )
  {
    if( $row = db_ReadNextRow( $sql ) )
    {
      $iserror = TRUE;
      $error_message .= ERROR_LOGIN_ALREADY_USED;
    }
  }
  if( ($sql = db_UserGet( '', 'usr_mail="'.$user_email.'"' )) != FALSE )
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
    db_UserRegister( $user_login, $user_passw, $user_displ, $user_email );
    db_close();
    $success_message = INFO_USER_REGISTERED;
  }
}

/****************************************************************
* If any error occured, display error message
*****************************************************************/
if( $error_message != '' )
{
  $form = '';
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

if( $form == '' )
{
  if( $error_message == '' )
  {
    $text .= PAGE_TEXT_REGISTRATION1;
    $text .= PAGE_TEXT_REGISTRATION2;
  }
  $text .= '
    <form action="'.$GLOBALS['self'].'" method="post">
    <div class="form_group">
      <span class="form_group_span">'.TITLE_TEXT_LOGIN_DATA.'</span>
    
        <div class="group">
          <div class="groupname">'.FORM_TEXT_LOGIN_NAME.' (*):</div>
          <div class="groupvalue"><input type="text" name="user_1" value="'.$user_login.'" size="30">
          </div>
        </div>
        <div class="group">
          <div class="groupname">'.FORM_TEXT_DISPLAY_NAME.' (*):</div>
          <div class="groupvalue"><input type="text" name="user_3" value="'.$user_displ.'" size="30">
          </div>
        </div>
        <div class="group">
          <div class="groupname">'.FORM_TEXT_EMAIL.' (*):</div>
          <div class="groupvalue"><input type="text" name="user_4" value="'.$user_email.'" size="30">
          </div>
        </div>
        <div class="group">
          <div class="groupname">'.FORM_TEXT_PASSWORD.' (*):</div>
          <div class="groupvalue"><input type="password" name="user_2" value="" size="30"></div>
        </div>
        <div class="group">
          <div class="groupname">'.FORM_TEXT_PASSWORD_RETYPE.' (*):</div>
          <div class="groupvalue"><input type="password" name="user_02" value="" size="30"></div>
        </div>
     
    </div>
  
    <div style="clear: left;">
      <input type="Submit" name="user_registration" value="'.BTN_OK.'" class="button">
    </div>

    </form>
  ';
}
else
{
  $text .= '
    <div style="clear: left;">
      '.PAGE_TEXT_REGISTRATION3.'
    </div>
  ';
}

fnShowPage( $caption, $text );

?>
