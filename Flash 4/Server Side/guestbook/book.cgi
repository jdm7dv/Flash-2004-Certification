#!/client/bin/perl
 

$basedir=".";
$listfile="book.txt";

if (!$ARGV[0]) {
	if($ENV{'REQUEST_METHOD'} eq 'GET')
	{ $ARGV[0] = $ENV{'QUERY_STRING'};
   	}
	else 
	{ read(STDIN, $ARGV[0], $ENV{'CONTENT_LENGTH'});
	}
}
if ($ARGV[0]) {
	%FORM;
	&get_arg;
		
	if ($FORM{'todo'} eq 'read' ) {
		&read_book;
	}

	if ($FORM{'todo'} eq 'sign' ) {
		&sign_book;
	}
}
else {
	print "no parameters!\n";
}	


sub get_arg {
 @pairs = split(/&/, $ARGV[0]);
 foreach $pair (@pairs) {
      ($name, $value) = split(/=/, $pair);
       $value =~ tr/+/ /;
       $value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
       $value =~ s/<!--(.|\n)*-->//g;      
       $FORM{$name} = $value;
  } #foreach
} #end get_arg


sub read_book {
open (LISTE,"<$basedir/$listfile") || die $!;
@liste = <LISTE>;
close (LISTE);
$ccount=0;
print "Content-type: text/html\n\n";
	foreach $zeile (@liste){
		#print "coeof=true&";
		print $zeile;
		print "&";
		$ccount++;
	} #foreach
print "&count=$ccount&eof=true";
}

sub sign_book {
$ccount=1;
	&datum;
	open (LISTE,"<$basedir/$listfile") || die $!;
	@liste = <LISTE>;
	close (LISTE);
	foreach $zeile (@liste){ $ccount++; }

	open (BOOK,">>$basedir/$listfile") || die $!;
	print BOOK "aname$ccount=$FORM{'name'}&acomment$ccount=$FORM{'comment'}&aurl$ccount=$FORM{'url'}&adate$ccount=$long_date&aemail$ccount=$FORM{'email'}\n";
	close (BOOK);

	print "Content-type: text/html\n\n";
	print "eof=true";
} #end sign_book

sub datum {
   ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
   if ($sec < 10) { $sec = "0$sec";  }
   if ($min < 10) { $min = "0$min"; }
   if ($hour < 10) {$hour = "0$hour"; }
   if ($mon < 10) { $mon = "0$mon"; }
   if ($mday < 10) { $mday = "0$mday"; }
   $month = ($mon + 1);
   @months = ("Januar","Februar","M&auml;rz","April","Mai","Juni","Juli","August","September","Oktober","November","Dezember");
   $date = "$mday.$month.$year";
   chop($date) if ($date =~ /\n$/);
   $long_date = "$mday\. $months[$mon] 19$year ($hour\.$min Uhr)";
  # $zeit ="$hour\.$min Uhr";
  # return $date;
}


exit;

