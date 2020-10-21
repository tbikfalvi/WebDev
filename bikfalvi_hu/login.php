<?php

if( isset($_POST['user_name']) && isset($_POST['user_password']) )
{
  $userid = 0;
  $loginname = '';

  db_connect();
  $authok = db_AuthUser( $_POST['user_name'], $_POST['user_password'], $userid, $loginname );
  db_close();
  
  if( $authok )
  {
    /************************************* 
    * User just logged in 
    * create current_user session variable 
    **************************************/
    $_SESSION['current_user'] = $loginname;
    $_SESSION['USERID'] = $userid;

    /*if( !isset($_COOKIE['auto_login_user']) )
    {  
      setcookie("auto_login_user", $_POST['user_name'], time()+1209600 );
    }*/
  }
}
else if( isset($_POST['btn_logoff_user']) )
{
  /************************************* 
  * Current user just logged off 
  * delete it's session variable 
  **************************************/
  unset($_SESSION['current_user']);
  unset($_SESSION['USERID']);
}
//else if( $GLOBALS['auto_user'] != '' && !isset($_SESSION['current_user']) )
//{
  /************************************* 
  * Current user previously saved user 
  * name in cookie, retrieve user name 
  * and auto login with creating 
  * current_user session variable      
  **************************************/
//  $_SESSION['current_user'] = $GLOBALS['auto_user'];
//}

if( isset($_SESSION['current_user']) )
{
  $GLOBALS['page_title'] .= ' - '.$_SESSION['current_user']; 
  $GLOBALS['login'] = '
  	<form id="logoff_user" action="'.$GLOBALS['self'].'" method="post" name="logoff_user">
      '.sprintf( LOGIN_LOGGED_IN, $_SESSION['current_user'] ).'
  	  <input type="Submit" name="btn_logoff_user" value="'.LOGIN_LOGOFF.'" class="button">	
    </form>
  ';
}
else
{
  $GLOBALS['login'] = '
  	<form id="login_user" action="'.$GLOBALS['self'].'" method="post" name="login_user">
      '.LOGIN_USERNAME.':
  	  <input type="Text" name="user_name" value="" size="15">
      '.LOGIN_PASSWORD.':
  	  <input type="Password" name="user_password" value="" size="15">
  	  <input type="Submit" name="btn_login_user" value="'.LOGIN_LOG_IN.'" class="button">	
    </form>
  ';
}

?>
