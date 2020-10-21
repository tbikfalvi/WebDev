<?php

include_once( 'bikfalvi.php' );

$caption = PAGE_CAPTION_NEWS;
$text = '';

$text .= '
<script type="text/javascript"><!--
function kibe(details,divid)
{
	if(document.getElementById(divid).style.display!=\'none\')
	{
		document.getElementById(divid).style.display=\'none\';
		document.getElementById(details).textContent = "'.PAGE_NEWS_DETAILS_SHOW.'";
	}
  else
  {
		document.getElementById(divid).style.display=\'block\';
		document.getElementById(details).textContent = "'.PAGE_NEWS_DETAILS_HIDE.'";
	}
}
--></script>
';

db_connect();

if( ($sql = db_NewsGet( '', 'nws_dt_post DESC', '0, 10' )) != FALSE )
{
  while( $row = db_ReadNextRow( $sql ) )
  {
    $text .= '
      <img src="images/news/'.$row['nwt_image'].'" width="16" height="16">
      <span class="newstitle">'.$row['nws_title'].'</span>
      <span class="newsdate">'.substr($row['nws_dt_post'],0,10).'</span>
      <br>
      <span class="newssum">'.$row['nws_sum'].'</span>
      <span id="details'.$row['nws_id'].'" onclick="kibe(\'details'.$row['nws_id'].'\',\'description'.$row['nws_id'].'\');" style="cursor: pointer; cursor: hand; font-size: 9px;">'.PAGE_NEWS_DETAILS_SHOW.'</span>
      <span id="description'.$row['nws_id'].'" style="display:none;">      
      '.nl2br($row['nws_text']).'
      </span>
      <p>
      ';
  }
}

db_close();

fnShowPage( $caption, $text );

?>
