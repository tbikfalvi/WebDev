<?php

$mySQLserver    = 'localhost';
$mySQLuser      = 'bikfalvi';
$mySQLpassword  = 'mcpp07';
$mySQLdefaultdb = 'bikfalvi';

$content = '
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <title></title>
  </head>
  <body>
';

$db_connection = mysql_connect( $mySQLserver, $mySQLuser, $mySQLpassword );
mysql_select_db( $mySQLdefaultdb );
mysql_query("SET CHARACTER SET 'latin2'");

$query = 'SELECT * FROM chatbox ORDER BY ch_datetime DESC';
$query_result = mysql_query( $query );

while( $row = mysql_fetch_array( $query_result, MYSQL_ASSOC ) )
{
  $content .= '
    <span class="username">'.$row['ch_username'].'</span>
    <span class="postdate">'.substr($row['ch_datetime'],0,16).'</span>
    <br>
    <span class="post">'.nl2br($row['ch_post']).'</span><br>
  ';
}

$content .= '
  </body>
</html>
';

echo $content;

?>
