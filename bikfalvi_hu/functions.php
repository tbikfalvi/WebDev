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

/****************************************************************
* Function: fnEchoSelectionList
* Parameters: -
* Return value: - 
*****************************************************************/
function fnEchoSelectionList( $sql_result, $name, $value )
{
  $sql_result = mysql_query( $sql_source );
  if( $sql_result != FALSE )
  {
    $text = '
      <select name="'.$name.'" class="tbox">
    ';
    while( $row = db_ReadNextRow( $sql_result ) )
    {
      if( $row['value'] == $value )
		  {
  	  	$text .= '
          <option value="'.$row['value'].'" selected>'.$row['text'].'</option>
        ';
    	}
    	else
  		{
  	  	$text .= '
          <option value="'.$row['value'].'">'.$row['text'].'</option>
        ';
    	}
    }
    $text .= '
      </select>
    ';
  }

  return $text;
}

/****************************************************************
* Function: fnGetExtension
* Parameters: -
* Return value: - 
*****************************************************************/
function fnGetExtension( $file )
{
	$pos = strpos( $file, '.' );
	return substr( $file, $pos+1, strlen($file)-$pos-1 );
}

/****************************************************************
* Function: fnGetPostVars
* Parameters: list of HTTP/POST variables to acquire
* Return value: - 
*****************************************************************/
function fnGetPostVars($list)
{
    foreach ( $list as $post_var )
    {
        global ${"$post_var"};
        if (isset($_POST["admin_$post_var"])) ${"$post_var"} = $_POST["admin_$post_var"];
        else ${"$post_var"} = '';
    }
}

/****************************************************************
* Function: fnClearFormVars
* Parameters: list of variables to clear
* Return value: - 
*****************************************************************/
function fnClearFormVars($list)
{
    foreach ( $list as $post_var )
    {
        global ${"$post_var"};
        ${"$post_var"} = '';
    }
}

/****************************************************************
* Function: fnGetIPAddress
* Parameters: 
* Return value: - 
*****************************************************************/
function fnGetIPAddress()
{
    if (isset($_SERVER))
    {
        if (isset($_SERVER["HTTP_X_FORWARDED_FOR"]))
        {
            $realip = $_SERVER["HTTP_X_FORWARDED_FOR"];
        }
        elseif (isset($_SERVER["HTTP_CLIENT_IP"]))
        {
            $realip = $_SERVER["HTTP_CLIENT_IP"];
        }
        else
        {
            $realip = $_SERVER["REMOTE_ADDR"];
        }
    }
    else
    {
        if ( getenv( 'HTTP_X_FORWARDED_FOR' ) )
        {
            $realip = getenv( 'HTTP_X_FORWARDED_FOR' );
        }
        elseif ( getenv( 'HTTP_CLIENT_IP' ) )
        {
            $realip = getenv( 'HTTP_CLIENT_IP' );
        }
        else
        {
            $realip = getenv( 'REMOTE_ADDR' );
        }
    }
    return $realip;
}

/****************************************************************
* Function: fnLogGuests
* Parameters: 
* Return value: - 
*****************************************************************/
function fnLogGuests()
{
  $filename = '.\logs\guests.txt';

  $handle = fopen( $filename, 'a+');

  if( $handle != FALSE )
  {
    fwrite( $handle, date( 'Y/m/d H:j:s' ).' '.fnGetIPAddress().chr(13).chr(10) );
    fclose( $handle );
  }
}

?>
