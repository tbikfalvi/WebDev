<?php
/*
+---------------------------------------------------------------+
|	bikfalvi website system
|
|	Tamas Bikfalvi 2007
|	http://www.bikfalvi.hu
|	bikfalvi.tamas@bikfalvi.hu
|
+---------------------------------------------------------------+
*/

$mySQLserver    = 'db.silihost.hu';
$mySQLuser      = 'shh_bikfalvi';
$mySQLpassword  = '7ksrzd6n';
$mySQLdefaultdb = 'shh_bikfalvi';

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
* SECURITY FUNCTIONS
*****************************************************************/

/****************************************************************
* Function: db_AuthUser
* Parameters: -
* Return value: - 
*****************************************************************/
function db_AuthUser( $name, $pass, &$id, &$login )
{
  $retval = false;
  
  $query = 'SELECT * FROM felhasznalok WHERE usr_login="'.$name.'" ';
  $sql_result = mysql_query( $query );
  if( $sql_result != FALSE )
  {
    $row = db_ReadNextRow( $sql_result );
    
    $password = md5( $pass );
    
    if( $row['usr_password'] === $password )
    {
      $id = $row['usr_id'];
      $login = $row['usr_display'];
      $retval = true;
    }
  }
  
  return $retval;
}

/****************************************************************
* Function: db_IsAdmin
* Parameters: -
* Return value: - 
*****************************************************************/
function db_IsAdmin( $id )
{
  $retval = FALSE;

  $query = 'SELECT * FROM felhasznalok WHERE usr_id="'.$id.'" ';
  $sql_result = mysql_query( $query );
  if( $sql_result != FALSE )
  {
    $row = db_ReadNextRow( $sql_result );

    if( $row['usr_admin'] == 1 || 
        $row['usr_admin_news'] == 1 )
      $retval = TRUE;
  }

  return $retval;
}

/****************************************************************
* Function: db_IsAdminRoot
* Parameters: -
* Return value: - 
*****************************************************************/
function db_IsAdminRoot( $id )
{
  $retval = FALSE;

  $query = 'SELECT * FROM felhasznalok WHERE usr_id="'.$id.'" ';
  $sql_result = mysql_query( $query );
  if( $sql_result != FALSE )
  {
    $row = db_ReadNextRow( $sql_result );

    if( $row['usr_admin'] == 1 )
      $retval = TRUE;
  }

  return $retval;
}

/****************************************************************
* Function: db_IsAdminNews
* Parameters: -
* Return value: - 
*****************************************************************/
function db_IsAdminNews( $id )
{
  $retval = FALSE;

  $query = 'SELECT * FROM felhasznalok WHERE usr_id="'.$id.'" ';
  $sql_result = mysql_query( $query );
  if( $sql_result != FALSE )
  {
    $row = db_ReadNextRow( $sql_result );

    if( $row['usr_admin_news'] == 1 )
      $retval = TRUE;
  }

  return $retval;
}

/****************************************************************
* USER FUNCTIONS
*****************************************************************/

/****************************************************************
* Function: db_UserRegister
* Parameters: -
* Return value: - 
*****************************************************************/
function db_UserRegister( $user_login, $user_passw, $user_displ, $user_email )
{
  $retval = false;
  
  $query = 'INSERT INTO felhasznalok ( usr_login, usr_password, usr_display, usr_mail ) VALUES ( "'.$user_login.'", "'.md5($user_passw).'", "'.$user_displ.'", "'.$user_email.'" ) ';
  $sql_result = mysql_query( $query );
  if( $sql_result != FALSE )
  {
    $retval = TRUE;
  }

  return $retval;
}

/****************************************************************
* Function: db_UserGet
* Parameters: -
* Return value: - 
*****************************************************************/
function db_UserGet( $fields, $filter, $debug=FALSE )
{
  $query = 'SELECT * FROM felhasznalok ';
  
  if( $fields != '' )
    $query = 'SELECT '.$fields.' FROM felhasznalok ';
  if( $filter != '' )
    $query .= 'WHERE '.$filter.' ';

  if( $debug )
    echo $query;
    
  return mysql_query( $query );
}

/****************************************************************
* Function: db_GetUserPassword
* Parameters: -
* Return value: - 
*****************************************************************/
function db_GetUserPassword( $id )
{
  /* ures jelszo -> d41d8cd98f00b204e9800998ecf8427e */
  $retval = '<not_defined>';
  
  $query = 'SELECT * FROM felhasznalok WHERE usr_id="'.$id.'" ';
  $sql_result = mysql_query( $query );
  if( $sql_result != FALSE )
  {
    $row = db_ReadNextRow( $sql_result );
    $retval = $row['usr_password'];
  }

  return $retval;
}

/****************************************************************
* Function: db_SetUserPassword
* Parameters: -
* Return value: - 
*****************************************************************/
function db_SetUserPassword( $id, $psw )
{
  $retval = false;
  
  $query = 'UPDATE felhasznalok SET usr_password="'.md5($psw).'" WHERE usr_id="'.$id.'" ';
  $sql_result = mysql_query( $query );
  if( $sql_result != FALSE )
  {
    $retval = TRUE;
  }

  return $retval;
}

/****************************************************************
* Function: db_UserMainDataMod
* Parameters: -
* Return value: - 
*****************************************************************/
function db_UserMainDataMod( $user_login, $user_displ, $user_email, $id )
{
  $retval = false;
  
  $query = 'UPDATE felhasznalok SET usr_login="'.$user_login.'", usr_display="'.$user_displ.'", usr_mail="'.$user_email.'" WHERE usr_id="'.$id.'" ';
  $sql_result = mysql_query( $query );
  if( $sql_result != FALSE )
  {
    $retval = TRUE;
  }

  return $retval;
}

/****************************************************************
* NEWS FUNCTIONS
*****************************************************************/

/****************************************************************
* Function: db_NewsGet
* Parameters: -
* Return value: - 
*****************************************************************/
function db_NewsGet( $condition, $order, $limit, $debug=FALSE )
{
  $query = 'SELECT * FROM hirek, hirek_tipus WHERE hirek.nws_type=hirek_tipus.nwt_id ';
  
  if( $condition != '' )
    $query .= 'AND '.$condition.' ';
  if( $order != '' )
    $query .= 'ORDER BY '.$order.' ';
  if( $limit != '' )
    $query .= 'LIMIT '.$limit.' ';
  if( $debug )
    echo $query;
    
  return mysql_query( $query );
}

/****************************************************************
* Function: db_NewsTypeGet
* Parameters: -
* Return value: - 
*****************************************************************/
function db_NewsTypeGet( $condition, $order, $limit, $debug=FALSE )
{
  $query = 'SELECT * FROM hirek_tipus WHERE nwt_id>0 ';
  
  if( $condition != '' )
    $query .= 'AND '.$condition.' ';
  if( $order != '' )
    $query .= 'ORDER BY '.$order.' ';
  if( $limit != '' )
    $query .= 'LIMIT '.$limit.' ';
  if( $debug )
    echo $query;
    
  return mysql_query( $query );
}

/****************************************************************
* Function: db_NewsTypeAdd
* Parameters: -
* Return value: - 
*****************************************************************/
function db_NewsTypeAdd( $newstype_name, $newstype_image, $debug=FALSE )
{
  $query = 'INSERT INTO hirek_tipus ( nwt_name, nwt_image ) VALUES ( "'.$newstype_name.'", "'.$newstype_image.'" ) ';

  if( $debug )
    echo $query;

  return mysql_query( $query );
}

/****************************************************************
* Function: db_NewsTypeMod
* Parameters: -
* Return value: - 
*****************************************************************/
function db_NewsTypeMod( $nwt_id, $nwt_name, $nwt_image, $debug=FALSE )
{
  $query = 'UPDATE hirek_tipus SET nwt_name="'.$nwt_name.'", nwt_image="'.$nwt_image.'" WHERE nwt_id='.$nwt_id.' ';
  
  if( $debug )
    echo $query;

  return mysql_query( $query );
}

/****************************************************************
* Function: db_NewsTypeDel
* Parameters: -
* Return value: - 
*****************************************************************/
function db_NewsTypeDel( $condition='', $debug=FALSE )
{
  $query = 'DELETE FROM hirek_tipus WHERE nwt_id>0 ';
  
  if( $condition != '' )
    $query .= 'AND '.$condition.' ';
  if( $debug )
    echo $query;
    
  return mysql_query( $query );
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

?>

