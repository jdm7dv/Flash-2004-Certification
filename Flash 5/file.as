datelength = length(date1);
mc = 1;
st = 2;
/date:sub = substring(date1, 1, 1);
while (Number(mc)<Number(datelength)) {
	duplicateMovieClip ("/date", "ndate" add mc, mc);
	setProperty ("ndate" add mc, _x, Number(getProperty("/date", _x)*mc)+20);
	set ("ndate" add mc add ":sub", substring(date1, st, 1));
	mc = Number(mc)+1;
	st = Number(st)+1;
}

// *****TESTING OUTPUT*****
con = datelength;
numdup = mc;
testextract = st;
