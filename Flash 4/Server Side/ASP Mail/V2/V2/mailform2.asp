<%response.buffer=true%>
<!--#include file="cookielib.asp"-->
<!--#include file="flash4lib.asp"-->
<%

'Get the populating variables from the HTTP Header and the Server
STATUS = Request("STATUS")
HateCookies = Request("HateCookies")
encryptit = Request("encryptit")

'check status then do what it says
if STATUS = "getcookienames" Then
	GetCookies
elseif STATUS = "sendingmessage" Then
	SendMessage
else
	message = "No functions sent to the script"
	response.write("&message="+URLEncode(message))
	currentdate=now()
	response.write("&date="+URLEncode(now()))
	Response.End
end if

function GetCookies ()
	blank = ""
	name = GetCookie("cookiename","Name")
	email = GetCookie("cookiename","Email")
	dates = GetCookie("cookiename","Date")
	EncryptCookies = GetCookie("cookiename","Encrypt")
    'Are the cookies encrypted?
    If EncryptCookies = "yes" Then
	    name = Decrypt(name)
	    email = Decrypt(email)
    End If
	  if name = "" Then
		response.write("&name="+URLEncode(blank))
	  End If
	  If email = "" Then
	  	response.write("&email="+URLEncode(blank))
	  End If
	  If dates = "" Then
	  	response.write("&date="+URLEncode(blank))
	  End If
	  If name <> "" Then
	  	response.write("&name="+URLEncode(name))
      	  End If
      If EncryptCookies <> "" Then
	  	response.write("&EncryptCookies="+URLEncode(EncryptCookies))
     	  End If
      If email <> "" Then
	  	response.write("&email="+URLEncode(email))
     	  End If
      If dates <> "" Then
        datemessage = "You last visited us on - " & dates
	  	response.write("&date="+URLEncode(datemessage))
      	  End If
	Response.End
End Function

function SendMessage ()

' Never cache this response
Response.Expires = 0

' Get data from their request
subject = Request.form("subject")
email = Request.form("email")
body = Request.form("body")
name = Request.form("name")

if subject = "" Then
	message = "No subject!? Please go back and try again"
	response.write("&message="+URLEncode(message)+"&confirm=1")
	response.end
elseif body = "" Then
	message = "I see no message!! Please go back and try again"
	response.write("&message="+URLEncode(message)+"&confirm=1")
	response.end
elseif email = "" Then
	email = "anon@anon.co.uk"
else

'check if they want the cookies encrypted
If EncryptCookies = "yes" Then
    name = Encrypt(name)
    email = Encrypt(email)
End If

	currentdate=now()

If HateCookies = "no" Then
Call AddCookie("cookiename", "Name", name, 365)
Call AddCookie("cookiename", "Email", email, 365)
Call AddCookie("cookiename", "Date", currentdate, 365)
Call AddCookie("cookiename", "Encrypt", encryptit, 365)
End If

'First mailing to you with the message
subject = subject & " - [mailform]"
from = email
'Calling mailing routine
SendMail email, from, subject, name, body

'Second mailing to the user saying thanks
subject = subject & " - [thanks for the comments]"
from = "you@yourdomain.co.uk"
body = "Thanks very much for your comments. " & CHR(10)
body = body & "We take great care to review each point " & CHR(10)
body = body & "The Crew" & CHR(10)
'Calling mailing routine
SendMail email, from, subject, name, body

End If
	Response.End
End Function


Function SendMail (email, from, subject, name, body)

Set SMTPObj = CreateObject("WebHostMeMail.SMTP")
SMTPObj.SMTPServer = "mail.webhostme.com"
SMTPObj.ToAdd = email
SMTPObj.FromAdd = from
SMTPObj.Subject = subject
SMTPObj.Body = body
SMTPObj.Connect
result = SMTPObj.EMail
message = "Thanks " & name & ". Your message has been sent - " & result
response.write("message="+URLEncode(message))
SMTPObj.Quit

End Function

Private Function Encrypt(strOriginal)
Dim strNew ' As String
Dim i ' As Integer 

For i = 1 To Len(strOriginal)
If strNew <> "" Then
strNew = strNew & "-"
End If
strNew = strNew & _
Asc(Mid(strOriginal, i, 1)) + 20 

Next ' i
Encrypt = strNew
End Function 

Private Function Decrypt(strEncrypted)
Dim strNew 'As String
Dim i ' As Integer 
Dim a_strCharacters() 'As String
a_strCharacters =  _

Split(strEncrypted, "-")
For i = 1 To UBound(a_strCharacters)
strNew = strNew & _
Chr(CInt(a_strCharacters(i))- 20)
Next ' i 
Decrypt = strNew 
End Function 

%> 