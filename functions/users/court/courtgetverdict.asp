<!--#include file="database.asp" -->

<%
	
	If Session("Authenticated") = 0 or Session("access") <> 3 Then
		Session.Timeout=5	
		Session("TimeoutMsg")=1	
		Response.Redirect ("login.asp")	
	End if

Dim num
num = request.querystring("q")

sql="SELECT ID, FIRSTNAME, LASTNAME, OFFENCENAME, COURTDATE, COURTTIME FROM offence, courtorder WHERE offence.id = courtorder.offenceid AND id = " & num

Set rs = Server.CreateObject("ADODB.RecordSet")	
rs.Open sql, nswjlps_STRING

response.write("<p>")
do until rs.EOF
  for each x in rs.Fields
    response.write("<b>" & x.name & ": </b>")
    response.write("" & x.value & "</br>")
  next
  rs.MoveNext
loop
response.write("</p>")

%>
