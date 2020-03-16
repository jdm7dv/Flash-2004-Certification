<!--#include file="flash4lib.asp"-->
<%
Dim fs, obj

' Never cache the chat session
Response.Expires = 0

Const ForReading = 1, ForWriting = 2, ForAppending = 3
counterfile=server.mappath("usercount.txt")

Set fs = CreateObject("Scripting.FileSystemObject")
    Set obj = fs.OpenTextFile(counterfile, ForReading, TristateFalse)
    counterline = Clng(obj.ReadLine)

      if Session("counterline") = "" then
         Session("counterline") = counterline
         counterline = counterline + 1
         obj.close
         Set obj = fs.CreateTextFile(counterfile, ForWriting, True, TristateFalse)
         obj.WriteLine(counterline)
      end if    

    obj.Close
                      
   Set obj = Nothing
   Set fs = Nothing

                      
response.write("&aspcount="+URLEncode(counterline))
%>
