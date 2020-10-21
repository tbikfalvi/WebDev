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
