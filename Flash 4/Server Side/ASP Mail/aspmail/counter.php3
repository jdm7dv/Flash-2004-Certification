<? 
/* 
  Original Design >>
  (c)1998 David W. Bettis
   
  modified for F4 >>
  (c)1999 Thomas Leitch
  http://domaindlx.com/the-hub
*/ 

// file for the counter 
$counterTextFile =  "counter.txt"; 
//counter size
$maxsize = 6; 

function displayCounter($counterTextFile) { 
  global $maxsize; 
 
    $fp   = fopen($counterTextFile,rw); 
    $num  = fgets($fp,$maxsize); 
    $num += 1; 

    for ($i=0; $i<strlen($num); $i++) { 
	//$val = substr($num, $i, 1);
        $val = substr($num, $i, 1); 
        $counterstring = $counterstring .  "&count$i=$val";     
    } 

    print  "$counterstring"; 
    exec( "rm -rf $counterTextFile"); 
    exec( "echo $num > $counterTextFile"); 
} 

if (!file_exists($counterTextFile)) { 
        exec( "echo 1 > $counterTextFile"); 
} 
displayCounter($counterTextFile); 

?>