<?php

$month = strftime('%m', strtotime('now'));

$GLOBALS['datumido'] = '
<div id="Clock">&nbsp;</div>

<script type="text/javascript">
<!--
var DayNam = new Array("'.DAY_7.'","'.DAY_1.'","'.DAY_2.'","'.DAY_3.'","'.DAY_4.'","'.DAY_5.'","'.DAY_6.'" );
var MnthNam = new Array("'.MONTH_01.'","'.MONTH_02.'","'.MONTH_03.'","'.MONTH_04.'","'.MONTH_05.'","'.MONTH_06.'","'.MONTH_07.'","'.MONTH_08.'","'.MONTH_09.'","'.MONTH_10.'","'.MONTH_11.'","'.MONTH_12.'" );
//-->
</script>
<script type="text/javascript" src="js/clock.js"></script>
';

?>
