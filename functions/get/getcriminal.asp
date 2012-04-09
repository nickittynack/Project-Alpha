<!--#include file="database.asp" -->

<%

	
	If Session("Authenticated") = 0 or Session("access") <> 2 Then
		Session.Timeout=5	
		Session("TimeoutMsg")=1	
		Response.Redirect ("login.asp")	
	End if		



response.expires=-1
sql="SELECT * FROM criminal order by lastName"

Set rs = Server.CreateObject("ADODB.RecordSet")	

rs.Open sql, nswjlps_STRING

dim id(5000)
dim first(5000)
dim last(5000)
dim licence(5000)
dim dob(5000)
dim suburb(5000)
dim state(5000)
dim street(5000)
dim phone(5000)


'CHANGE BOTH TO UPPER CASE

i=1

Do Until rs.EOF	
		id(i)= rs("id")
		first(i) = rs("firstName")
		last(i) = rs("lastName")	
		licence(i) = rs("licenceNumber")
		dob(i) = rs("DOB")	
		street(i) = rs("streetAddress")
		suburb(i) = rs("suburb")
		state(i) = rs("state")		
		i=i+1
		rs.movenext
Loop


'get the q parameter from URL
f=UCase(request.querystring("f"))
l=UCase(request.querystring("l"))
sb=UCase(request.querystring("sb"))
st=UCase(request.querystring("st"))
lc=UCase(request.querystring("lc"))


'lookup all hints from array if length of q>0

response.write "<div class='row'>"  
response.write "<table id='gradient-style' style='width:700px; font-size:12px; border:0px; margin:0; padding-top:0;'>"  
response.write "<thead><tr>"
response.write "<th style='height:17px;padding:0;text-align:left;padding-left:5px;' scope='col'>Name</th>"
response.write "<th style='height:17px;padding:0;text-align:left;' scope='col'>Licence No</th>"
response.write "<th style='height:17px;padding:0;text-align:left;padding-left:5px;' scope='col'>Address</th>"
response.write "<th style='height:17px;padding:0;text-align:center;' scope='col'>DOB</th>"
response.write "<th style='height:17px;padding:0;text-align:left;' scope='col'></th>"
response.write "</tr></thead>"
response.write "<tfoot><tr><td colspan='5'></td></tr></tfoot>"

response.write "<tbody>"
  
if len(f)>0 or len(l)>0 or len(sb)>0 or len(st)>0 or len(lc)>0 then
  for i=1 to ubound(first)
																																		'because licence number can be null is database, we need these three checks for lc
      if f = mid(first(i),1,len(f)) and l = mid(last(i),1,len(l)) and sb = mid(suburb(i),1,len(sb)) and st = mid(state(i),1,len(st)) and ((lc = mid(licence(i),1,len(lc))) or (IsNull(licence(i)) and len(lc)<1 ))then
		response.write "<tr><td style='height:17px; padding:0;'>" & first(i) & " " & last(i) & "</td><td style='height:17px; padding:0;'>" & licence(i) & "</td><td style='height:17px; padding:0;'>" & street(i) &" "& suburb(i) &", "& state(i) &  "</td><td style='height:17px; padding:0;text-align:right;padding-right:10px;'>" & dob(i) & "</td><td style='height:17px; padding:0;'><button value='" & id(i) & "' type='button' style='font-size:8px;' onclick='editCriminal(this.value)'>Edit</button></td></tr>"
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