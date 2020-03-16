<%

' Never cache this response
Response.Expires = 0

' Get data from their request
subject = Request.form("subject")
email = Request.form("email")
body = Request.form("body")
name = Request.form("name")


if subject = "" Then
	message = "No subject!? Please go back and try again"
	response.write("message="+URLEncode(message)+"&confirm=1")
elseif body = "" Then
	message = "I see no message!! Please go back and try again"
	response.write("message="+URLEncode(message)+"&confirm=1")
elseif email = "" Then
	email = "anon@anon.co.uk"
else

Set SMTPObj = CreateObject("WebHostMeMail.SMTP")
SMTPObj.SMTPServer = "mail.webhostme.com"
SMTPObj.ToAdd = "to-you@yourdomain.co.uk"
SMTPObj.FromAdd = email
SMTPObj.Subject = "Your site comments - " & subject
SMTPObj.Body = name & " (" & email & ") " & "says this - " & body
SMTPObj.Connect
result = SMTPObj.EMail
message = "Thanks " & name & ". Your message has been sent - " & result
response.write("message="+URLEncode(message)+"&confirm=2")
SMTPObj.Quit

End If

' Encode a number from 0..15 to a single hex digit
Function HexChar(ByVal i)
	If i < 10 Then
		HexChar = Chr(i+Asc("0"))
	Else
		HexChar = Chr(i-10+Asc("A"))
	End If
End Function

' Encode the control and punctuation characters in a string to %xx hex values
Function URLEncode(ByVal s)
	Dim result, ch
	Do While Len(s) > 0
		ch = Asc(s)
		s = Right(s, Len(s)-1)
		If (ch >= Asc("a") And ch <= Asc("z")) Or (ch >= Asc("A") And ch <= Asc("Z")) Or (ch >= Asc("0") And ch <= Asc("9")) Then
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

%> 