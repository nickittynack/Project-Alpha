<!--#include file="database.asp" -->

<%
	
	If Session("Authenticated") = 0 or Session("access") <> 2 Then
		Session.Timeout=5	
		Session("TimeoutMsg")=1	
		Response.Redirect ("login.asp")	
	End if		



response.expires=-1
sql="SELECT * FROM offence"
'WHERE offenceName = '" & request.querystring("q") & "'"

Set rs = Server.CreateObject("ADODB.RecordSet")	
rs.Open sql, nswjlps_STRING

response.write("<table>")
do until rs.EOF
  for each x in rs.Fields
    response.write("<tr><td><b>" & x.name & "</b></td>")
    response.write("<td>" & x.value & "</td></tr>")
  next
  rs.MoveNext
loop
response.write("</table>")
%>