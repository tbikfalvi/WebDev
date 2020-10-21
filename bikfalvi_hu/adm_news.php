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

include_once( 'bikfalvi.php' );

$caption = PAGE_CAPTION_ADMIN_NEWS;
$text = '';

/****************************************************************
* Jogosultság ellenõrzés
*****************************************************************/

if( !isset($_SESSION['USERID']) )
{
  echo '<script>location.replace("index.php"); </script>';
}
else
{
  db_connect();
  if( !db_IsAdminNews( $_SESSION['USERID'] ) )
  {
    echo '<script>location.replace("index.php"); </script>';
  }
  db_close();
}

$text .= '
<script type="text/javascript"><!--
function kibe(divid)
{
	if(document.getElementById(divid).style.display!=\'none\')
	{
		document.getElementById(divid).style.display=\'none\';
	}
  else
  {
		document.getElementById(divid).style.display=\'block\';
	}
}
--></script>
';


/****************************************************************
* Form paraméterek
*****************************************************************/

$formtype = 'new';	
$error_message = '';
$success_message = '';

$form = '';
if( isset($_POST['hirek_tipus_hozzaadas']) )    $form = 'newstypeadd';
if( isset($_POST['hirek_tipus_szerkesztes']) )  $form = 'newstypeedi';
if( isset($_POST['hirek_tipus_modositas']) )    $form = 'newstypemod';
if( isset($_POST['hirek_tipus_torles']) )       $form = 'newstypedel';

$post_vars = array(
    'nwt_id',
    'nwt_name',
    'nwt_image' );

fnGetPostVars( $post_vars );

/**************************************************************
* Form-ok hibakezelese
**************************************************************/
if( $form == 'newstypeadd' || $form == 'newstypemod' )
{
  if( $nwt_name == '' ) $error_message = ERROR_NEWSTYPE_NAME_EMPTY;
  db_connect();
  if( ($sql = db_NewsTypeGet( 'nwt_name="'.$nwt_name.'"', $order='', $limit='' )) != FALSE )
  {
    if( $row = db_ReadNextRow( $sql ) )
    {
      if( $row['nwt_id'] != $nwt_id ) $error_message = ERROR_NEWSTYPE_NAME_EXISTS;
    }
  }
  db_close();
}

/**************************************************************
* Form-ok feldolgozása
**************************************************************/

if( $error_message == '' )
{
  db_connect();
  if( $form == 'newstypeadd' )
  {
		if( db_NewsTypeAdd($nwt_name, $nwt_image) == FALSE )
		{
			$error_message .= sprintf( SQL_ERR_UNABLE_TO_ADD, TITLE_NEWSTYPE, mysql_error() );
		}
    else 
    {
			$success_message .= sprintf( SQL_SUCCESS_ADD, TITLE_NEWSTYPE );
			fnClearFormVars($post_vars);
		}
  }
  else if( $form == 'newstypeedi' )
  {
    if( ($sql = db_NewsTypeGet( 'nwt_id='.$nwt_id, '', '' )) != FALSE )
    {
      $row = db_ReadNextRow( $sql );
      $nwt_name  = $row['nwt_name'];
      $nwt_image = $row['nwt_image'];
      
      $formtype = 'edit';
    }
  }
  else if( $form == 'newstypemod' )
  {
		if( db_NewsTypeMod( $nwt_id, $nwt_name, $nwt_image ) == FALSE )
		{
			$error_message .= sprintf( SQL_ERR_UNABLE_TO_MODIFY, TITLE_NEWSTYPE, mysql_error() );
		}
    else 
    {
			$success_message .= sprintf( SQL_SUCCESS_MODIFY, TITLE_NEWSTYPE );
			fnClearFormVars($post_vars);
		}
  }
  else if( $form == 'newstypedel' )
  {
    if( db_NewsTypeDel( 'nwt_id='.$nwt_id ) == FALSE )
		{
			$error_message .= sprintf( SQL_ERR_UNABLE_TO_DELETE, TITLE_NEWSTYPE, mysql_error() );
		}
    else 
    {
			$success_message .= sprintf( SQL_SUCCESS_DELETE, TITLE_NEWSTYPE );
		}
  }
  db_close();
}

/****************************************************************
* If any error occured, display error message
*****************************************************************/
if( $error_message != '' )
{
  $text .= '
    <div class="error_group">'.$error_message.'</div>
  ';
}

/****************************************************************
* If form process succeeded, display success message
*****************************************************************/
else if( $success_message != '' )
{
  $text .= '
    <div class="success_group">'.$success_message.'</div>
  ';
}	

/**************************************************************
* Oldal megjelenítése
**************************************************************/

/***** Hír típus felvétele/módosítása ************************/
$target = $formtype == 'new' ? 'hirek_tipus_hozzaadas' : 'hirek_tipus_modositas';
$title = $formtype == 'new' ? sprintf(ADMIN_MANAGE_DB_ADDNEW,TITLE_NEWSTYPE) : sprintf(ADMIN_MANAGE_DB_MODIFY,TITLE_NEWSTYPE);

$text .= '
  <div class="form_group">
    <span class="form_group_span">'.$title.'</span>
    
      <form action="'.$GLOBALS['self'].'" method="post">
        <div class="group">
          <div class="groupname">'.FORM_TEXT_NAME.':</div>
          <input type="Hidden" name="admin_nwt_id" value="'.$nwt_id.'">
          <div class="groupvalue"><input type="text" name="admin_nwt_name" value="'.$nwt_name.'" size="30"></div>
        </div>
        <div class="group">
          <div class="groupname">'.FORM_TEXT_IMAGE.':</div>
          <div class="groupvalue">
            <select name="admin_nwt_image">
';
if( $the_dir = opendir( 'images/news' ) )
{
  while( $the_file = readdir( $the_dir ) )
  {
    if( !is_dir( $the_file ) )
    {
      $extension = fnGetExtension( $the_file );
      if( $extension == 'png' )
      {
        if( $the_file == $nwt_image )
        {
          $text .= '
            <option value="'.$the_file.'" SELECTED>'.$the_file.'</option>
          ';
        }
        else
        {
          $text .= '
            <option value="'.$the_file.'">'.$the_file.'</option>
          ';
        }
      }
    }
  }
}
$text .= '
            </select>
          </div>
        </div>
        <div class="group">
          <div class="groupname"><input type="Submit" name="'.$target.'" value="'.BTN_OK.'" class="button"></div>
        </div>
      </form>
     
  </div>
  
  <div id="showhidelist" onclick="kibe(\'list\');"><img src="images/openlist.png" width="16" height="16"></div>
';

/***** Hír típusok listájának megjelenítése ******************/
$text .= '
  <div class="form_group" id="list" style="display:none;">
    <span class="form_group_span">'.sprintf(ADMIN_MANAGE_DB_LIST,TITLE_NEWSTYPE).'</span>
    
';
db_connect();
if( ($sql = db_NewsTypeGet( '', '', '' )) != FALSE )
{
  while( $row = db_ReadNextRow( $sql ) )
  {
    $text .= '
      <li>
        <form action="'.$GLOBALS['self'].'" method="post">
        <div class="list_id">'.$row['nwt_id'].'</div>
        <div class="list_name">'.$row['nwt_name'].'</div>
        <div class="list_image">'.$row['nwt_image'].'</div>
        <div class="list_action">
          <input type="Hidden" name="admin_nwt_id" value="'.$row['nwt_id'].'">
          <input type="image" name="hirek_tipus_szerkesztes" value="edit" title="'.FORM_TEXT_EDIT.'" src="images/edit.png">
          <input type="image" name="hirek_tipus_torles" value="delete" title="'.FORM_TEXT_DELETE.'" src="images/delete.png">
        </div>
        </form>
      </li>
    ';
  }
}
db_close();
$text .= '
  </div>
';

fnShowPage( $caption, $text );

?>
