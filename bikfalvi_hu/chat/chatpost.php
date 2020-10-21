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

include_once( 'chatsql.php' );

$chat_post_enabled  = false;
$chat_post_user     = '';

parse_str( $_SERVER['QUERY_STRING'] );

if( isset($postenabled) )
{
  $chat_post_enabled = ($postenabled=='true'?true:false);
}
if( isset($user) )
{
  $chat_post_user = $user;
}

if( isset($_POST['chat_btn_post']) )
{
  $chat_user = $chat_post_user; 
  $chat_date = Date( 'Y-m-d G:i:s' );
  $chat_text = $_POST['chat_text'];

  db_connect();
  
  $query = 'INSERT INTO chatbox (ch_username, ch_datetime, ch_post) VALUES ("'.$chat_user.'", "'.$chat_date.'", "'.$chat_text.'")';
  mysql_query($query);
    
  db_close(); 
}

$content = '
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <link rel="stylesheet" href="chat.css" type="text/css">
  <title></title>
  </head>
  <body>
';

if( $chat_post_enabled )
{
  $content .= '
    <form id="chat_post" action="chatpost.php?postenabled=true&user='.$chat_post_user.'" method="post" name="chat_post">
      <div class="post_username">'.$chat_post_user.'</div>
      <textarea name="chat_text" rows="4" class="post_textarea"></textarea><br>
      <input type="Submit" name="chat_btn_post" value="'.CHAT_BTN_POST.'" class="post_submit_button">
    </form>
  ';
}
else
{
  $content .= '<span class="text_light">'.CHAT_POST_NOT_ALLOWED.'</span>';
}

$content .= '
  </body>
</html>
';

echo $content;

?>
