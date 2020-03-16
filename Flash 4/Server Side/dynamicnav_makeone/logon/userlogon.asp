<%response.buffer=true%>
<!--#include file="flash4lib.asp"-->
<% 


dim fwConnect
dim RS, RS2, RecS3
dim SQL
dim error_notice

fwConnect = "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("userlogon.mdb") & ";" & "FIL=MS Access;"


' Populating variables from the HTTP Header and the Server
action = Request("action")

if action = "registeruser" Then
	Register_User
elseif action = "preregisteruser" Then
	Pre_Register_User
elseif action = "userlogon" Then
	UserLogon
elseif action = "checkaccess" Then
	Check_Access
else
	response.write "no way man!"
	Response.End
end if

Function UserLogon
Error = false
name = Request.form("username")
password = Request.form("password")
 
   SQL = "SELECT * FROM User_Logon_System WHERE Name = '" & name & "';"
    OpenDB(SQL)
   
    if not (rs.eof and rs.bof) then
		rs.movefirst
	end if

dbname = rs("Name")
dbpassword = rs("Password")
logon_times = rs("Logon_Times")
dbemail = rs("Email")
dbreg = rs("Datereg")
 
If password = dbpassword Then
   logon_times = logon_times + 1
   rs.update
    CloseDB
    '-=-=-What do you want it to say?
    message = "You have now logged on to the system."
    response.write("&Logonresponse="+URLEncode(message))
    response.write("&AllowMemberUse=true")
    Session("AllowMemberUse") = "Yes"
    Session("USER_NAME") = dbname
    Session("PASSWORD") = dbpassword
    Session("EMAIL") = dbemail
    Session("DATE_REG") = dbreg
    Session("LOGON_TIMES") = logon_times
			

Else
    '-=-=-What do you want it to say?
    message = "That is the incorrect password for that Username"
    response.write("&Logonresponse="+URLEncode(message))
    response.write("&AllowMemberUse=false")
    Session("AllowMemberUse") = "No"
End If

End Function


Function Register_User
Dim checking
email = Request.form("email")
name = Request.form("username")
password = request.form("password")
datereg = now()


	e = email
	if right(e, 2) = ", " then e = left(e, len(e)-2)

SQL = "SELECT * FROM User_Logon_System WHERE Email = '" & e & "';"
OpenDB(SQL)

if not (rs.eof and rs.bof) then
	Error = True
    RRerror = True
        Rerror = Rerror & vbCr + "Someone has already registered with that email address."
        if not RRerror Then
        response.write("&ureg=problem")
        End If
end if

CloseDB
   
   
        e = email
        n = name

SQL = "SELECT * FROM User_Logon_System WHERE Name = '" & n & "';"
OpenDB(SQL)


if not (rs.eof and rs.bof) then
	Error = True
    RRerror = True
        Rerror = Rerror & vbCr + "That username is already taken, please try again."
        if not RRerror Then
        response.write("&ureg=problem")
        End IF
End If

CloseDB

If Rerror <> "" Then
		response.write("&error="+URLEncode(Rerror))
        Response.end
        Exit Function
End If

    name = n
    
If not Error Then 'And RRerror then 

            SQL = "INSERT INTO User_Logon_System (Name, Email, Datereg, Password, Logon_Times) VALUES ("
            SQL = SQL & "'" & name & "', "
            SQL = SQL & "'" & email & "', "
            SQL = SQL & "'" & datereg & "', "
            SQL = SQL & "'" & password & "', "
            SQL = SQL & "'0')"

OpenDB(SQL)
CloseDB
   '-=-=-What do you want it to say?
	msg = "Thanks " & name & "." & vbCr & "You have been registered for YOUR-NAME-HERE."
	response.write("&ureg=noproblem"+"&error="+URLEncode(msg))
        Session("AllowMemberUse") = "Yes"
Response.End
End If

End Function


Function Pre_Register_User

' Send todays date and time to user
response.write("&date_reg="+URLEncode(now()))
response.end

End Function


Function Check_Access

mdata = Request("mdata")

If Session("AllowMemberUse") = "Yes" Then
  If mdata = "Yes" Then
    username = Session("USER_NAME")
    password = Session("PASSWORD")
    email = Session("EMAIL")
    date_reg = Session("DATE_REG")
    logontimes = Session("LOGON_TIMES")
     response.write("&username="+URLEncode(username)+"&password="+URLEncode(password)+"&email="+URLEncode(email)+"&date_reg="+URLEncode(date_reg)+"&logontimes="+URLEncode(logontimes))
  End If

response.write("&AllowMemberUse=true")

Else

response.write("&AllowMemberUse=false")

End If

End Function


Sub OpenDB(SQL)
   Set DB = Server.CreateObject("ADODB.Connection")
   DB.ConnectionString = fwConnect
   DB.Open 
   Set RS = Server.CreateObject("ADODB.Recordset")
   RS.Open SQL, DB, 3, 3
End Sub

Sub CloseDB
	Set RS = Nothing
	Set DB = Nothing
End Sub


%>