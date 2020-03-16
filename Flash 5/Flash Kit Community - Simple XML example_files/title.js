<!--

// Generates the info contained in the title bar. Automatically sets up the bookmark details

document.write("Bookmark Us");

if (navigator.appName == "Microsoft Internet Explorer")

	{ document.write(" - <A href=\"javascript:window.external.AddFavorite('"+location.href+"','"+document.title+"')\">Click Here</A>");}	

else if (navigator.appName == "Netscape")

	{ document.write(" - Press Ctrl + D");	}

document.write(" | ");

document.write("<a href='http://www.flashkit.com/arcade/setup.shtml?/cgi-bin/links_game/jump.pl?ID=388'>Cartoon of the day</a>");

document.write(" | ");

document.write("<a href='http://www.flashkit.com/board/tellafriend.php?url="+location.href+"'>Tell a friend!</a>");

document.write(" | ");

document.write("<a href='http://www.flashkit.com/board/member.php?action=signup' target='_top'>Join Up!</a>");
document.write(" | ");

document.write("<a href='http://www.flashkit.com/board/member.php?action=signup' target='_top'>Newsletter</a>");

//-->	
