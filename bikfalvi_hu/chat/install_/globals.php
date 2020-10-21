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

$create_table_sql = '
  CREATE TABLE `chatbox` (
    `ch_id` int(11) NOT NULL auto_increment,
    `ch_username` varchar(20) collate latin2_hungarian_ci NOT NULL,
    `ch_datetime` datetime NOT NULL,
    `ch_post` mediumtext collate latin2_hungarian_ci NOT NULL,
    PRIMARY KEY  (`ch_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_hungarian_ci AUTO_INCREMENT=1 ;
';

$head_start = '
<!DOCTYPE HTML PUBLIC "-//WebTechs//DTD Mozilla HTML 2.0//EN">
<HTML>
<HEAD>
  <TITLE>'.$page_title.'</TITLE>
  <META NAME="author" CONTENT="Bikfalvi Tamás">
  <link rel="stylesheet" href="../chat.css" type="text/css">
  <link rel="shortcut icon" href="favicon.ico">
';

$head_end = '
</HEAD>
';

$body_start = '
<body>
';

$body_end = '
</body>
';

$foot = '
</html>
';

function fnShowPage( $caption, $text )
{
  $GLOBALS['body'] .= '<div id="caption">'.$caption.'</div>';
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

function fnCheckSQLConnection( $mySQLserver, $mySQLuser, $mySQLpassword, $mySQLdefaultdb )
{
  $bRet = true;
  
	if( !($db_connection = @mysql_connect( $mySQLserver, $mySQLuser, $mySQLpassword )) )
    return false;
    
	mysql_select_db( $mySQLdefaultdb );

  $bRet = mysql_query("SET CHARACTER SET 'latin2'");

	mysql_close( $db_connection );
	
	return bRet;
}

function fnCreateSQLTable( $mySQLserver, $mySQLuser, $mySQLpassword, $mySQLdefaultdb )
{
  $bRet = true;
  
	if( !($db_connection = @mysql_connect( $mySQLserver, $mySQLuser, $mySQLpassword )) )
    return false;
    
	mysql_select_db( $mySQLdefaultdb );

  $query = $GLOBALS['create_table_sql'];
  $bRet = mysql_query( $query );

	mysql_close( $db_connection );

	return bRet;
}

function fnCreateConfigStr( $sql_username, $sql_userpsw, $sql_database )
{
$sql_config_file = '
<?php
/*
+---------------------------------------------------------------+
|	bikfalvi chatbox system
|
|	Tamas Bikfalvi 2007
|	http://www.bikfalvi.hu
|	bikfalvi.tamas@bikfalvi.hu
|
+---------------------------------------------------------------+
*/

$mySQLserver    = \'localhost\';
$mySQLuser      = \''.$sql_username.'\';
$mySQLpassword  = \''.$sql_userpsw.'\';
$mySQLdefaultdb = \''.$sql_database.'\';

?>
';

return $sql_config_file;
}

?>

