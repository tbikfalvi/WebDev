<?php

include_once( 'bikfalvi.php' );

$head .= '
<link rel="stylesheet" href="css/lightbox.css" type="text/css" media="screen" />
<script src="js/prototype.js" type="text/javascript"></script>
<script src="js/scriptaculous.js?load=effects" type="text/javascript"></script>
<script src="js/lightbox.js" type="text/javascript"></script>
';

$caption = '';
$text = '';

$text .= '
<div id="caption_page">Galéria</div>
<p>
';

fnShowPage( $caption, $text );

?>
