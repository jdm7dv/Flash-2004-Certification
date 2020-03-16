<% 

' Encode a number from 0..15 to a single hex digit
Function HexChar(ByVal i)
	If i < 10 Then
		HexChar = Chr(i+Asc("0"))
	Else
		HexChar = Chr(i-10+Asc("A"))
	End If
End Function

' Encode the control and punctuation characters in a string to %xx hex values
' This helps send the information back to Flash in a way which it can recieve
' and decode. It is just some quite complicated Maths encoding 
Function URLEncode(ByVal s)
	Dim result, ch
	Do While Len(s) > 0
		ch = Asc(s)
		s = Right(s, Len(s)-1)
		If (ch >= Asc("a") And ch <= Asc("z")) Or (ch >= Asc("A") And ch <= Asc("Z")) Then
			result = result & Chr(ch)
		ElseIf ch = Asc(" ") Then
			result = result & "+"
		Else
			'result = result & "*" & ch
			'result = result & "!" & (ch/16) & (ch mod 16)
			result = result & "%" & HexChar(Int(ch/16)) & HexChar(ch Mod 16)
		End If
	Loop
	URLEncode = result
End Function

' We don't want to cache the chat session in browsers, it could lead to problems
Response.Expires = 0

' Get the action to perform - flash is sending it in the form of ?action=XXX
action = Request.QueryString("action")

' Get the data which we are sending
msg = Request.form("msg")
user = Request.form("user")
id = Request.form("id")
If Len(id) = 0 Then
	id = "default"
End If

' Protect access to the chat session
' We don't want anybody to connect with any program
Application.Lock
' We have now locked the ID/chat room
If action = "send" Then
	' Add the string to the chat session
	list = Application(id)
	' Send the chat to the correct chat room
	list = list + user + ">" + msg + chr(13)
	' Send the new message and add it to the end of the rest of the chat
	Application(id) = list
ElseIf action = "clear" Then
	' Clear the chat session
	' You can make an admin version of you chat app which uses this action
	' I have made the clearing local so people can't just clear the whole 
	' session!
	list = ""
	Application(id) = list
ElseIf action = "userlist" Then
	'List all the users
	use = Application(id)
	use = user
	Application(id) = use
	' experimental - and not working :(
ElseIf action = "update" Then
	' Just return the current chat session
	list = Application(id)
End If
Application.Unlock

' Return the chat session
response.write("list="+URLEncode(list))

%>
