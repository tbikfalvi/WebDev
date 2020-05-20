<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML>
<HEAD>
<TITLE>Játékoslista</TITLE>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-2">
<LINK type=text/css rel=stylesheet>
<BODY>

<?php
$con =mysql_connect("localhost","AirDbAcC","Fm89SD_j");
if (!$con)
{
	die('Could not connect: ' . mysql_error());
}

mysql_select_db("airsoft");

$topic_id=$_GET['id'];


$query = "SELECT * FROM jatekszervezes_Szervez WHERE topic_id = ".$topic_id;
$result = mysql_query($query);

if (!$result) {
    $message  = 'Invalid query: ' . mysql_error() . "\n";
    $message .= 'Whole query: ' . $query;
    die($message);
}

while ($row = mysql_fetch_assoc($result)) 
{
$md_date = $row['GameDate'];
$md_fee = $row['Fee'];
$md_battlefield = $row['BattleField'];
}

mysql_free_result($result);

$query =  "SELECT topic_title FROM " . $table_prefix . "topics WHERE topic_id = ".$topic_id;
$result = mysql_query($query);

if (!$result) {
    $message  = 'Invalid query: ' . mysql_error() . "\n";
    $message .= 'Whole query: ' . $query;
    die($message);
}

//$row = mysql_fetch_assoc($result);
while ($row = mysql_fetch_assoc($result)) {
    $md_topicname = $row['topic_title'];
}

mysql_free_result($result);


echo '<table align="center" border = "1" cellpadding = "10px" >';
echo '<tr><td align="center"><b>'.$md_topicname.'</b></td>';
echo '    <td align="center"><b>'.$md_date.'</b></td>';
echo '    <td align="center"><b>'.$md_fee.'</b></td>';
echo '    <td align="center"><b>'.$md_battlefield.'</b></td></tr></table>';

// ez akkor kellene, ha oldalanként akarnánk listázni, de most elvileg játékosonként kell
/*$sql = "SELECT side_id, IF(side_player < 1, 9999, side_player) side_player, IF(side_player < 1, concat('|Nem J&#225;t&#233;kos - ',side_name), side_name) side_name, side_open FROM Sides WHERE topic_id=$topic_id ORDER BY side_name";

$result = mysql_query($query);

if (!$result) {
    $message  = 'Invalid query: ' . mysql_error() . "\n";
    $message .= 'Whole query: ' . $query;
    die($message);
}

// Use result
// Attempting to print $result won't allow access to information in the resource
// One of the mysql result functions must be used
// See also mysql_result(), mysql_fetch_array(), mysql_fetch_row(), etc.
while ($row = mysql_fetch_assoc($result)) 
{
	$sides[] = $row;
}

mysql_free_result($result);

for ($i = 0, $size = sizeof($sides); $i < $size; $i++)
{
	$sql = "SELECT * FROM jatekszervezes_jelentk WHERE status=1 AND topic_id=$topic_id and SET side=$kside WHERE user_id = $sel_user[$i] and topic_id=$topic_id"; 	
	$db->sql_query($sql);
}*/


echo '<table border = "1" cellpadding = "10px" >';
echo '<tr><td align="center">Sorszam</td><td align="center">Név</td><td align="center">Csapat</td><td align="center">Fizetett?</td><td align="center">Oldal</td><td align="center">Raj</td><td align="center">Fegyver</td><td align="center">Plusz emberek</td><td align="center">Megjegyzés</td></tr>';

$query = "SELECT u.username, s.side_name, j.* FROM jatekszervezes_jelentk j, Sides s, jatekszervezes_users u WHERE u.user_id=j.user_id AND j.topic_id=".$topic_id."  AND status=1 AND s.side_id=j.side ORDER BY u.username";

$result = mysql_query($query);

if (!$result) {
    $message  = 'Invalid query: ' . mysql_error() . "\n";
    $message .= 'Whole query: ' . $query;
    die($message);
}

$i = 1;
while ($row = mysql_fetch_assoc($result)) 
{
echo '<tr>';
echo '<td>'.$i.'</td>';
echo '<td>'.$row['username'].'</td>';
echo '<td>'.$row['team'].'</td>';
echo '<td>'.$row['reg_accept'].'</td>';
echo '<td>'.$row['side_name'].'</td>';
echo '<td>'.$row['platoon'].'</td>';
echo '<td>'.$row['weap_m'].'/'.$row['fps_m'].' FPS, '.$row['weap_s'].'/'.$row['fps_s'].'FPS </td>';
echo '<td>'.$row['extra_player'].'</td>';
echo '<td>'.$row['remark'].'</td>';
echo '</tr>';
$i++;
}

mysql_free_result($result);

echo '</table>';

?>

</BODY>
</HTML>
