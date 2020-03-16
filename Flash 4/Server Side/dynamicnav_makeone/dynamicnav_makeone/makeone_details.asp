<%@ language="VBScript" %>

<%
    
  ' Set file i/o constants.
    Const ForReading = 1
    Const ForWriting = 2
    Const ForAppending = 8

    path = "e:\inetpub\wwwroot\davidcolquhoun\3dynanav\"
    
    set fs = CreateObject("Scripting.FileSystemObject")
    
    ' create name array
    dim allnamesarray()
    namesarrayitemcount = 0
    namesfilename = path & "namelist.txt"
    set file = fs.opentextfile(namesfilename, forreading)
    do while not file.atendofstream
      line = file.readline 
      namesarrayitemcount = namesarrayitemcount + 1
      redim preserve allnamesarray(namesarrayitemcount)
      allnamesarray(namesarrayitemcount) = line
    loop

    set tmp_count = request("count")
    if tmp_count = "" then 
       tmp_count = 8
    end if
   
   
    Randomize
   
%>


<html>
<head>
<title>www.davidcolquhoun.com</title>
</head>
<body text="#FFFFFF" bgcolor="#003333">

<font face="Verdana, Arial, Helvetica, sans-serif" size="3">
Enter the details for each menu item.....

<br>


<form method="post" action="makeone_display.asp">
<input type="hidden" name="count" value="<%=tmp_count%>">


<table border="0" cellspacing="0" cellpadding="3">
  <tr>
    <td align=center>&nbsp;</td>
    <td align=left><font face="Verdana, Arial, Helvetica, sans-serif" size="3">Item Name</font></td>
    <td align=left><font face="Verdana, Arial, Helvetica, sans-serif" size="3">URL</font></td>
    <td align=center><font face="Verdana, Arial, Helvetica, sans-serif" size="3">X</font></td>
    <td align=center><font face="Verdana, Arial, Helvetica, sans-serif" size="3">Y</font></td>
    <td align=center><font face="Verdana, Arial, Helvetica, sans-serif" size="3">Z</font></td>
    <td align=center>&nbsp;</td>
  </tr>
<%   

    counter = 0
    do while (counter < int(tmp_count))
      counter = counter + 1
      
      if counter > 50 then 
        Exit do
      end if
      
      upper = 200
      lower = 1
      tmp_x = int((upper - lower + 1) * RND + lower) - 100
      tmp_y = int((upper - lower + 1) * RND + lower) - 100
      tmp_z = int((upper - lower + 1) * RND + lower) - 100
    
      upper = 50
      lower = 1
      whichname = int((upper - lower + 1) * RND + lower)
      name = allnamesArray(whichname)

%>
  <tr>
    <td align=center><font face="Verdana, Arial, Helvetica, sans-serif" size="3"><%=counter%></font></td>
    <td align=center><input type=text name="<%=counter%>d" size=16 maxlength=32 value="<%=name%>"></td>
    <td align=center><input type=text name="<%=counter%>u" size=32 maxlength=64 value="http://www.davidcolquhoun.com"></td>
    <td align=center><input type=text name="<%=counter%>x" size=3 maxlength=3 value="<%=tmp_x%>"></td>
    <td align=center><input type=text name="<%=counter%>y" size=3 maxlength=3 value="<%=tmp_y%>"></td>
    <td align=center><input type=text name="<%=counter%>z" size=3 maxlength=3 value="<%=tmp_z%>"></td>
    <td align=center>
      <select name="<%=counter%>g">
      <option selected value="1">Red
      <option value="2">Blue
      <option value="3">Green
      <option value="4">Purple
      <option value="5">Light Blue
      </select>
    
    </td>
  </tr>
<%

    loop
    
%>
  <tr>
    <td align=right colspan=7><input type="submit", name="next", value="Next &gt;&nbsp;&gt;"></td>
  </tr>
</table>

</form>
<br>
<br>

</font>
</body>
</html>
