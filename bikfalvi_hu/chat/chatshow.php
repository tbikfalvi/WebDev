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

include_once( 'chatsql.php' );

$content = '
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//HU">
<html>
  <head>
  <link rel="stylesheet" href="chat.css" type="text/css">
  <title></title>
  </head>
  <body>
    <div id="chat_messages">
';

  db_connect();
  if( ($sql = db_ChatGet()) != FALSE )
  {
    while( $row = db_ReadNextRow($sql) )
    {
      $content .= '
        <span class="username">'.$row['ch_username'].'</span>
        <span class="postdate">'.substr($row['ch_datetime'],0,16).'</span>
        <br>
        <span class="post">'.nl2br($row['ch_post']).'</span><br>
        <hr>
      ';
    }
  }
  db_close();

$content .= '
    </div>
  </body>
</html>
';

echo $content;

?>
