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

session_start();

include_once( 'globals.php' );

$lan_file = 'languages/'.$GLOBALS['language'].'.php';
include_once( file_exists($lan_file) ? $lan_file : 'languages/hun.php');

include_once( 'sql.php' );
include_once( 'init.php' );

include_once( 'login.php' );
include_once( 'datum.php' );
include_once( 'menu.php' );
include_once( 'functions.php' );

include_once( 'skeleton.php' );

/**************************************************************
* Chatbox on left pane
**************************************************************/

include_once( 'chat/chat.php' );

if( isset($_SESSION['current_user']) )
{
  $GLOBALS['leftpane'] .= fnChatPost( '155', '120', $_SESSION['current_user'], true );
}
else
{
  $GLOBALS['leftpane'] .= fnChatPost( '155', '120' );
}
$GLOBALS['leftpane'] .= fnChatShow( '155', '250' );

/**************************************************************
**************************************************************/

$head .= '
<link rel="stylesheet" href="css/bikfalvi.css" type="text/css">
<link rel="stylesheet" href="css/menu.css" type="text/css">
';

$header = '
<table class="alap" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="fej_bal"></td>
    <td class="fej_jobb">
      <div class="login">
        '.$GLOBALS['login'].'
      </div>
      <div class="hirdetes"></div>
      <div class="datumido">
        '.$GLOBALS['datumido'].'
      </div>
      <div class="menu">
        '.$GLOBALS['menu'].'
      </div>
    </td>
  </tr>
  <tr>
    <td class="tartalom_bal"><div class="bal">
			'.$GLOBALS['leftpane'].'
    </div></td>
    <td class="tartalom_jobb"><div class="jobb">
';

$footer = '
    </div></td>
  </tr>
  <tr>
    <td class="lab_bal"></td>
    <td class="lab_jobb"></td>
  </tr>
</table>
';

function fnShowPage( $caption, $text )
{
  $GLOBALS['body'] .= '<div id="caption_page">'.$caption.'</div>';
	$GLOBALS['body'] .= $text;

	echo $GLOBALS['head_start'];
	echo $GLOBALS['head'];
	echo $GLOBALS['head_end'];
	
	echo $GLOBALS['body_start'];
	echo $GLOBALS['header'];
	echo $GLOBALS['body'];
	echo $GLOBALS['footer'];
	echo $GLOBALS['body_end'];
	
	echo $GLOBALS['foot'];
}

?>
