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

$lan_file = 'language/'.$GLOBALS['language'].'.php';
include_once( file_exists($lan_file) ? $lan_file : 'language/hun.php');

/****************************************************************
* Check after install
*****************************************************************/

if( file_exists('install/install.php') && file_exists('adatbazis.inc.php') )
{
  // Install files did not deleted after install
  $errormsg = CHAT_ERROR_INSTALL_NOT_DELETED;
}

/****************************************************************
* Function: fnChatPost - display the post part of the chatbox
*                        in a separated iframe to be able to 
*                        send the new post without reloading the
*                        whole page
* Parameters: width    - width (in pixels) of the iframe
*             height   - height (in pixels) of the iframe
*             username - name of the user who post the message
*             enabled  - determines if the user can post message
* Return value: the html code needs to be inserted into the main
*               page; can be displayed with 'echo' php function
*****************************************************************/
function fnChatPost( $width, $height, $username='', $enabled=false )
{
  $content = '
    <iframe width="'.$width.'" height="'.$height.'" align="center" frameborder="0" scrolling="no" src="chat/chatpost.php?postenabled='.($enabled?'true':'false').'&user='.$username.'"></iframe>
  ';
  
  return $content;
}

/****************************************************************
* Function: fnChatShow - 
* Parameters: - 
* Return value: - 
*****************************************************************/
function fnChatShow( $width, $height )
{
  $content = '
    <iframe width="'.$width.'" height="'.$height.'" align="center" frameborder="1" scrolling="auto" src="chat/chatshow.php" style="overflow-x: hidden;"></iframe>
  ';
  
  return $content;
}

/****************************************************************
* Remove this if you want to display the chatbox in another way 
*****************************************************************/
/*
if( strlen($errormsg) > 0 )
{
  echo $errormsg;
  echo '<br>';
}
echo fnChatPost( 270, 120, 'ChatTestUser', true );
echo '<br>';
echo fnChatShow( 300, 300 );
*/
?>
