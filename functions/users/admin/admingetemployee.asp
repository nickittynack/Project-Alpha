<!--#include file="database.asp" -->

<%
	
	If Session("Authenticated") = 0 or Session("access") <> 1 Then
		Session.Timeout=5	
		Session("TimeoutMsg")=1	
		Response.Redirect ("login.asp")	
	End if
		



response.expires=-1
sql="SELECT * FROM employee"

Set rs = Server.CreateObject("ADODB.RecordSet")	

rs.Open sql, nswjlps_STRING

dim id(500)
dim first(500)
dim last(500)
dim status(500)
dim dob(500)

i=1

Do Until rs.EOF	
		'response.write "<p>g" & rs("id") & "</p>"
		id(i)= rs("employeeid")
		first(i) = UCase(rs("firstname"))
		last(i) = UCase(rs("lastname"))
		status(i) = rs("activeservice")
		dob(i) = rs("dob")
		i=i+1
		rs.movenext
Loop


'get the q parameter from URL
f=UCase(request.querystring("f"))
l=UCase(request.querystring("l"))
eid=request.querystring("eid")

'lookup all hints from array if length of q>0

response.write "<div class='row'>"  
response.write "<table id='gradient-style' style='width:700px; font-size:12px; border:0px; margin:0; padding-top:0;'>"  
response.write "<thead><tr>"
response.write "<th style='height:17px;padding:0;text-align:left;padding-left:5px;' scope='col'>Employee ID:</th>"
response.write "<th style='height:17px;padding:0;text-align:left;padding-left:5px;' scope='col'>First Name:</th>"
response.write "<th style='height:17px;padding:0;text-align:left;padding-left:5px;' scope='col'>Last Name:</th>"
response.write "<th style='height:17px;padding:0;text-align:left;padding-left:5px;' scope='col'>DOB:</th>"
response.write "<th style='height:17px;padding:0;text-align:left;padding-left:5px;' scope='col'>Status:</th>"
response.write "<th style='height:17px;padding:0;text-align:left;padding-left:5px;' scope='col'>Edit:</th>"
response.write "</tr></thead>"
response.write "<tfoot><tr><td colspan='5'></td></tr></tfoot>"

response.write "<tbody>"
  
if len(f)>0 or len(l)>0 or len(eid)>0 then
  for i=1 to ubound(first)
																																		
      if f = mid(first(i),1,len(f)) and l = mid(last(i),1,len(l)) and eid = mid(id(i),1,len(eid))then
		response.write "<tr><td style='height:17px; padding:0;'>" & id(i) & "</td><td style='height:17px; padding:0;'>" & first(i) & "</td><td style='height:17px; padding:0;'>"  & last(i) & "</td><td style='height:17px; padding:0;'>" & dob(i) & "<td style='height:17px; padding:0;text-align:right;padding-right:10px;'>" & status(i) & "</td><td><button value='" & id(i) & "'type='button' style='font-size:8px;' onclick='editUser(this.value)'>Edit</button></td></tr>"
    end if
  next
end if

response.write "</tbody>"
response.write "</table>"
response.write "</div>"

%>

<!--

response.write("<table>")

if len(q)>0 then
  for i=1 to ubound(a)
    if q = mid(a(i),1,len(q)) then
		response.write "<tr><td>" & b(i) & ", " & c(i) & "</td></tr>"
    end if
  next
end if

response.write("</table>")

-->