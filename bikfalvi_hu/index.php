<?php

include_once( 'bikfalvi.php' );

$caption = PAGE_CAPTION_WELCOME;
$text = PAGE_INDEX_WELCOME;

$text .= PAGE_TEXT_LATEST_NEWS;

fnLogGuests();

db_connect();
if( ($sql = db_NewsGet( '', 'nws_dt_post DESC', '0, 3' )) != FALSE )
{
  while( $row = db_ReadNextRow( $sql ) )
  {
    $text .= '
      <img src="images/news/'.$row['nwt_image'].'" width="16" height="16">
      <span class="newstitle">'.$row['nws_title'].'</span>
      <span class="newsdate">'.substr($row['nws_dt_post'],0,10).'</span>
      <br>
      <span class="newssum">'.$row['nws_sum'].'</span>
      <br>
      ';
  }
}

if( isset($_SESSION['USERID']) )
{
  if( db_IsAdminRoot( $_SESSION['USERID'] ) )
  {
    $text .= PAGE_TEXT_ADMIN_INFOS;
    
    if( ($sql = db_UserGet( 'COUNT(usr_id) as number', 'usr_status="0"' )) != FALSE )
    {
      $row = db_ReadNextRow( $sql );
      $text .= PAGE_TEXT_NUMBER_OF_UNACTIVATED_USERS.$row['number'].'<br>';
    }
  }
}

db_close();

fnShowPage( $caption, $text );

?>
