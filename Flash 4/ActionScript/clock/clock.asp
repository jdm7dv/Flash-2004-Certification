<%@Language = "VBScript"%>
<%
Option Explicit
Response.Buffer = True
Response.Expires = -1000

Response.Write "Hour=" & Hour(Now) & "&Minute=" & Minute(Now)
Response.Flush
%>