<!--#include file="database.asp" -->

<%

	
	If Session("Authenticated") = 0 or Session("access") <> 2 Then
		Session.Timeout=5	
		Session("TimeoutMsg")=1	
		Response.Redirect ("login.asp")	
	End if		



response.expires=-1
sql="SELECT * FROM offence order by lastName"

Set rs = Server.CreateObject("ADODB.RecordSet")	

rs.Open sql, nswjlps_STRING

dim offid(500)
dim first(500)
dim last(500)
'dim licence(500)
dim offence(500)
dim suburb(500)



'CHANGE BOTH TO UPPER CASE

i=1

Do Until rs.EOF	
		
		offid(i)= CStr(rs("id"))
		first(i) = rs("firstName")
		last(i) = rs("lastName")	
		offence(i) = rs("offenceName")
		suburb(i) = rs("offenceSuburb")		
		i=i+1
		rs.movenext
Loop

'get the q parameter from URL
id=request.querystring("id")
f=UCase(request.querystring("f"))
l=UCase(request.querystring("l"))
sb=UCase(request.querystring("sb"))
of=UCase(request.querystring("of"))

'lookup all hints from array if length of q>0

response.write "<div class='row'>"  
response.write "<table id='gradient-style' style='width:700px; font-size:12px; border:0px; margin:0; padding-top:0;'>"  
response.write "<thead><tr>"
response.write "<th style='height:17px;padding:0;' scope='col'>Offence ID</th>"
response.write "<th style='height:17px;padding:0;text-align:left;' scope='col'>Offence</th>"
response.write "<th style='height:17px;padding:0;text-align:left;' scope='col'>Offender Name</th>"
response.write "<th style='height:17px;padding:0;text-align:left;' scope='col'>Offence Suburb</th>"
response.write "<th style='height:17px;padding:0;' scope='col'></th>"
response.write "</tr></thead>"
response.write "<tfoot><tr><td colspan='5'></td></tr></tfoot>"

response.write "<tbody>"
  
'if len(f)>0 or len(l)>0 or len(sb)>0 or len(of)>0 or len(id)>0 then

if len(f)>0 or len(l)>0 or len(id)>0 or len(of)>0 or len(sb)>0 then
  for i=1 to ubound(first)																																		'because licence number can be null is database, we need these three checks for lc
      if f = mid(first(i),1,len(f)) and l = mid(last(i),1,len(l)) and id = mid(offid(i),1,len(id)) and sb = mid(suburb(i),1,len(sb)) and of = mid(offence(i),1,len(of)) then 'and ((lc = mid(licence(i),1,len(lc))) or (IsNull(licence(i)) and len(lc)<1 ))then
		response.write "<tr>"
		response.write "<td style='height:17px; padding:0;'>" & offid(i) & "</td>" ' <td style='height:17px; padding:0;'>" & licence(i) & "</td><td style='height:17px; padding:0;'>"& suburb(i) &", </td><td style='height:17px; padding:0;text-align:right;padding-right:10px;'></td><td style='height:17px; padding:0;'><button value='" & id(i) & "' type='button' style='font-size:8px;' onclick='editCriminal(this.value)'>Edit</button></td></tr>"
   		response.write "<td style='height:17px; padding:0;'>" & offence(i) & "</td>"
		response.write "<td style='height:17px; padding:0;'>" & first(i) & " " & last(i) & "</td>"
		response.write "<td style='height:17px; padding:0;'>" & suburb(i) & "</td>"	
		response.write "<td style='height:17px; padding:0;'><button value='" & offid(i) & "' type='button' style='font-size:8px;' onclick='editOffence(this.value)'>Edit</button></td>"
		response.write "</tr>" 
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