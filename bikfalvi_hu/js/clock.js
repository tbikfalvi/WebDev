<!--

function tick() {
  var hours, minutes, seconds, ap;
  var intHours, intMinutes, intSeconds;  var today;
  today = new Date();
  intDay = today.getDay();
  intDate = today.getDate();
  intMonth = today.getMonth();
  intYear = today.getYear();
  intHours = today.getHours();
  intMinutes = today.getMinutes();
  intSeconds = today.getSeconds();

  if (intYear < 2000) { intYear += 1900; }
  
	timeString = intYear+" "+MnthNam[intMonth]+" "+intDate+", "+DayNam[intDay];

	if (intHours == 0) {
     hours = "12:";
     ap = "am.";
  } else if (intHours < 12) { 
     hours = intHours+":";
     ap = "am.";
  } else if (intHours == 12) {
     hours = "12:";
     ap = "pm.";
  } else {
     intHours = intHours - 12
     hours = intHours + ":";
     ap = "pm.";
  }
  if (intMinutes < 10) {
     minutes = "0"+intMinutes;
  } else {
     minutes = intMinutes;
  }
  if (intSeconds < 10) {
     seconds = ":0"+intSeconds;
  } else {
     seconds = ":"+intSeconds;
  }
  timeString = (document.all)? timeString+", "+hours+minutes+seconds+" "+ap:timeString+" "+hours+minutes+" "+ap;
  var clock = (document.all) ? document.all("Clock") : document.getElementById("Clock");
  clock.innerHTML = timeString;
  (document.all)?window.setTimeout("tick();", 1000):window.setTimeout("tick();", 6000);
}

tick();

//-->
