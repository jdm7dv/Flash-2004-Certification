<%@ language="VBScript" %>

<%

  tmp_string = "3dynamicnav.swf?" & "count=" & request("count")
  
  for i = 1 to request("count")
    tmp_string = tmp_string & "&" & i & "d" & "=" & request(i & "d")
    tmp_string = tmp_string & "&" & i & "p"  & "="
    tmp_string = tmp_string & request(i & "x") & "," 
    tmp_string = tmp_string & request(i & "y") & "," 
    tmp_string = tmp_string & request(i & "z") 
    tmp_string = tmp_string & "&" & i & "u" & "=" & request(i & "u")
    tmp_string = tmp_string & "&" & i & "g" & "=" & request(i & "g")
  next
  

%>

  
<html>
<head>
<title>www.davidcolquhoun.com</title>
</head>
<body text="#FFFFFF" bgcolor="#003333">

<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
 codebase="http://active.macromedia.com/flash2/cabs/swflash.cab#version=4,0,0,0"
 id=3dynanav width=80% height=80%>
 <param name=movie value="<%=tmp_string%>"> 
 <param name=menu value=false>
 <param name=quality value=high>
 <param name=bgcolor value=#003333>
 
<embed src="<%=tmp_string%>" menu=false quality=high bgcolor=#003333  width=80% height=80% type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"></embed>


</object>
<br>
<font face="Verdana, Arial, Helvetica, sans-serif" size="1">
note: you can copy + paste the source html for this page and use it in your own site.
</font>

</body>
</html>

