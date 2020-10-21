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

include_once( 'adatbazis.inc.php' );

/****************************************************************
* GENERAL FUNCTIONS
*****************************************************************/

/****************************************************************
* Function: db_connect - open connection with SQL database with
*                        values defined in global variables
* Parameters: - 
* Return value: - 
*****************************************************************/
function db_connect() 
{
	global $db_connection, $mySQLserver, $mySQLuser, $mySQLpassword, $mySQLdefaultdb;

	$db_connection = mysql_connect( $mySQLserver, $mySQLuser, $mySQLpassword );
	mysql_select_db( $mySQLdefaultdb );
	
	mysql_query("SET CHARACTER SET 'latin2'");
}

/****************************************************************
* Function: db_close - close database connection identified with
*                      $db_connection global variable
* Parameters: -
* Return value: - 
*****************************************************************/
function db_close()
{
	global $db_connection;

	mysql_close( $db_connection );
}

/****************************************************************
* Function: db_ReadNextRow
* Parameters: -
* Return value: - 
*****************************************************************/
function db_ReadNextRow( $query_result )
{
  return mysql_fetch_array( $query_result, MYSQL_ASSOC );
}

/****************************************************************
* Function: db_ChatGet
* Parameters: -
* Return value: - 
*****************************************************************/
function db_ChatGet( $debug=FALSE )
{
  $query = 'SELECT * FROM chatbox ORDER BY ch_datetime DESC';

  if( $debug )
    echo $query;
    
  return mysql_query( $query );
}

/****************************************************************
* Function: db_
* Parameters: -
* Return value: - 
*****************************************************************/

?>
