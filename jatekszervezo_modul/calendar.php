<?php
/**
*
* @package ucp
* @version $Id: ucp.php 8915 2008-09-23 13:30:52Z acydburn $
* @copyright (c) 2005 phpBB Group
* @license http://opensource.org/licenses/gpl-license.php GNU Public License
*
*/

/**
* @ignore
*/
define('IN_PHPBB', true);
$phpbb_root_path = (defined('PHPBB_ROOT_PATH')) ? PHPBB_ROOT_PATH : './';
$phpEx = substr(strrchr(__FILE__, '.'), 1);
require($phpbb_root_path . 'common.' . $phpEx);
require($phpbb_root_path . 'includes/functions_user.' . $phpEx);
require($phpbb_root_path . 'includes/functions_module.' . $phpEx);

// Basic parameter data
$id 	= request_var('i', '');
$mode	= request_var('mode', '');

if ($mode == 'login' || $mode == 'logout' || $mode == 'confirm')
{
	define('IN_LOGIN', true);
}

// Start session management
$user->session_begin();
$auth->acl($user->data);
$user->setup('ucp');

// Setting a variable to let the style designer know where he is...
$template->assign_var('S_IN_CALENDAR', true);


// oldal lista játékos adminisztráláshoz

$sql = " SELECT curdate() today, month(curdate()) tomon, subdate(curdate(),DAYOFWEEK(curdate())-2) firstdate";
$result = $db->sql_query($sql);
$row = $db->sql_fetchrow($result);
$today = $row['today'];
$tomon = $row['tomon'];
$firstdate = $row['firstdate'];
$db->sql_freeresult($result);

$sql = '';
$full_week_data = array();

for ($i = -1; $i < 7; $i++)
{
	$sql .= " (SELECT year(adddate('$firstdate',".($i*7+3).")) yr, month(adddate('$firstdate',".($i*7+3).")) mn, 
		adddate('$firstdate',".($i*7).") day0, adddate('$firstdate',".($i*7+1).") day1, adddate('$firstdate',".($i*7+2).") day2, adddate('$firstdate',".($i*7+3).") day3, adddate('$firstdate',".($i*7+4).") day4, adddate('$firstdate',".($i*7+5).") day5, adddate('$firstdate',".($i*7+6).") day6, '$today' today, '$tomon' tomon ) UNION ";

}
$i = 7;
$sql .= " (SELECT year(adddate('$firstdate',".($i*7+3).")) yr, month(adddate('$firstdate',".($i*7+3).")) mn, 
		adddate('$firstdate',".($i*7).") day0, adddate('$firstdate',".($i*7+1).") day1, adddate('$firstdate',".($i*7+2).") day2, adddate('$firstdate',".($i*7+3).") day3, adddate('$firstdate',".($i*7+4).") day4, adddate('$firstdate',".($i*7+5).") day5, adddate('$firstdate',".($i*7+6).") day6, '$today' today, '$tomon' tomon ) ";

$result = $db->sql_query($sql);
while ($row = $db->sql_fetchrow($result))
{
	$full_week_data[] = $row;
}
$db->sql_freeresult($result);

$userid	= $user->data['user_id'];

for ($i = 0, $size = sizeof($full_week_data); $i < $size; $i++)
{
	for ($j = 0; $j < 7; $j++)
	{

		$sql = "SELECT s.*, t.topic_title, j.status FROM jatekszervezes_Szervez s LEFT OUTER JOIN jatekszervezes_jelentk j ON s.topic_id=j.topic_id and j.user_id=$userid, " . $table_prefix . "topics t WHERE t.topic_id=s.topic_id AND GameDate = '".substr($full_week_data[$i]['day'.$j],0,10)."'"; 
		
		$result = $db->sql_query($sql);
		$full_week_data[$i]['gamestring'.$j] = '';
		while ($row = $db->sql_fetchrow($result))
		{
			$classjelentk='';
			if ($row['status'] == 1)
			{
				$classjelentk=' class="jelentkezett" ';
			}
			$full_week_data[$i]['gamestring'.$j] .= '<a href="'.$phpbb_root_path.'viewtopic.php?t='.$row['topic_id'].'"'.$classjelentk.'>';
		
			$full_week_data[$i]['gamestring'.$j] .=$row['topic_title'].'<br>'.$row['BattleField'].', '.$row['jelplayernr'].'/'.$row['PlayerNr'];
			$full_week_data[$i]['gamestring'.$j] .='</a><hr/><br/>';
		}
		$db->sql_freeresult($result);
	}
}

foreach ($full_week_data as $dayz)
{
	$template->assign_block_vars('dayz', array(
		'DAY1'	=> substr($dayz['day1'],8,2),
		'DAY2'	=> substr($dayz['day2'],8,2),
		'DAY3' 	=> substr($dayz['day3'],8,2),
		'DAY4' 	=> substr($dayz['day4'],8,2),
		'DAY5' 	=> substr($dayz['day5'],8,2),
		'DAY6' 	=> substr($dayz['day6'],8,2),
		'DAY0' 	=> substr($dayz['day0'],8,2),
		'YEAR' 	=> $dayz['yr'],
		'MON' 	=> $dayz['mn'],
		'TODAY'	=> substr($dayz['today'],8,2),
		'TOMON'	=> $dayz['tomon'],
		'GAMESTRING1'=> $dayz['gamestring1'],
		'GAMESTRING2'=> $dayz['gamestring2'],
		'GAMESTRING3'=> $dayz['gamestring3'],
		'GAMESTRING4'=> $dayz['gamestring4'],
		'GAMESTRING5'=> $dayz['gamestring5'],
		'GAMESTRING6'=> $dayz['gamestring6'],
		'GAMESTRING0'=> $dayz['gamestring0'])
	);
}
unset($dayz);

// Output the page
page_header($user->lang['VIEW_TOPIC'] . ' - ' . $topic_data['topic_title']);

$template->set_filenames(array(
	'body' => 'calendar.html')
);
make_jumpbox(append_sid("{$phpbb_root_path}viewforum.$phpEx"), $forum_id);

page_footer();

?>