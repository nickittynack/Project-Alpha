<!--#include file="database.asp" -->

<%
	
	If Session("Authenticated") = 0 or Session("access") <> 2 Then
		Session.Timeout=5	
		Session("TimeoutMsg")=1	
		Response.Redirect ("login.asp")	
	End if		


response.expires=-1
sql="SELECT * FROM offenceType WHERE offenceName = '" & request.querystring("q") & "'"

Set rs = Server.CreateObject("ADODB.RecordSet")	
rs.Open sql, nswjlps_STRING

Session("pAddOffenceAction") = rs("offenceAction")

If rs("offenceAction") = "2" Then
	response.write"<div class='row'><span class='label'>Fine Amount:</span><span class='formw'>No immediate fine for this offence</span></div>"
else
	response.write"<div class='row'><span class='label'>Fine Amount:</span><span class='formw'>$" & rs("fineAmount") & "</span></div>"
end if

If rs("offenceAction") <> "1" Then
	response.write"<div class='row' style='padding-bottom:15px; padding-left:140px;'><b>This offence requires a court order</b></div>"	
	
	sqlCourtName="SELECT * FROM court"

	Set rs1 = Server.CreateObject("ADODB.RecordSet")	
	rs1.Open sqlCourtName, nswjlps_STRING
	
	response.write "<div class='row'>"
	response.write "<span class='label'>Court Name</span>"
	response.write "<span class='formw'><select name='courtname'>"
	response.write "<option value =''>Select Court</option>"

	Do Until rs1.EOF	
		court = rs1("CourtName")
		Response.write "<option value ='" &  court & "'>" & court & "</option>"
		rs1.movenext
	Loop
	
	response.write "</select></span></div>"
	
end if

%>

