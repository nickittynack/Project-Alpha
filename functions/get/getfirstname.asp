<!--#include file="database.asp" -->

<%


response.expires=-1
sql="SELECT * FROM criminal"

Set rs = Server.CreateObject("ADODB.RecordSet")	

rs.Open sql, nswjlps_STRING

dim id(10)
dim first(10)
dim last(10)
dim licence(10)
dim dob(10)
dim suburb(10)
dim state(10)
dim street(10)
dim phone(10)


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
f=request.querystring("f")
l=request.querystring("l")
sb=request.querystring("sb")
st=request.querystring("st")
lc=request.querystring("lc")


'lookup all hints from array if length of q>0

response.write "<div class='row'>"  
response.write "<table id='gradient-style' style='width:700px; font-size:12px; border:0px; margin:0; padding-top:0;'>"  
response.write "<thead><tr>"
response.write "<th style='height:17px;padding:0;' scope='col'>Name</th>"
response.write "<th style='height:17px;padding:0;' scope='col'>Licence No</th>"
response.write "<th style='height:17px;padding:0;' scope='col'>Address</th>"
response.write "<th style='height:17px;padding:0;' scope='col'>DOB</th>"
response.write "<th style='height:17px;padding:0;' scope='col'></th>"
response.write "</tr></thead>"
response.write "<tfoot><tr><td colspan='5'></td></tr></tfoot>"

response.write "<tbody>"
'response.write "<tr><td>1st row</td></tr>"
  
if len(f)>0 or len(l)>0 or len(sb)>0 or len(st)>0 or len(lc)>0 then
'response.write "<p> " & id(1) & "</p>"
  for i=1 to ubound(first)
  'response.write "<p> " & id(1) & "</p>"
    if f = mid(first(i),1,len(f)) and l = mid(last(i),1,len(l)) and sb = mid(suburb(i),1,len(sb)) and st = mid(state(i),1,len(st)) and ((lc = mid(licence(i),1,len(lc))) or (IsNull(licence(i)) and len(lc)<1 ))then
		'response.write "<p> " & id(i) & "</p>"
		
		response.write "<tr><td style='height:17px; padding:0;'>" & first(i) & " " & last(i) & "</td><td style='height:17px; padding:0;'>" & licence(i) & "</td><td style='height:17px; padding:0;'>" & street(i) &" "& suburb(i) &", "& state(i) &  "</td><td style='height:17px; padding:0;'>" & dob(i) & "</td><td style='height:17px; padding:0;'><button value='" & id(i) & ","& first(i)& "," & last(i) & "' type='button' style='font-size:8px;' onclick='loadSuburb(this.value)' >Select</button></td></tr>"
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