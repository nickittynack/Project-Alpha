<!--#include file="database.asp" -->

<%

	
If Session("Authenticated") = 0 or Session("access") <> 3 Then
	Session.Timeout=5	
	Session("TimeoutMsg")=1	
	Response.Redirect ("login.asp")	
End if		

response.expires=-1
sql="SELECT offence.id, offence.firstname, offence.lastname, offence.offencename, courtorder.courtname, courtorder.courtdate, courtorder.courttime FROM offence, courtorder WHERE offence.id = courtorder.offenceid AND courtstatus <> 'VERDICT DECIDED'"

Set rs = Server.CreateObject("ADODB.RecordSet")	

rs.Open sql, nswjlps_STRING

dim id(5000)
dim first(5000)
dim last(5000)
dim offence(5000)
dim court(5000)
dim courtd(5000)
dim courtt(5000)

Dim curdate
curdate = Date()

'CHANGE BOTH TO UPPER CASE

i=1

Do Until rs.EOF	
		'response.write "<p>g" & rs("id") & "</p>"
		id(i)= rs("id")
		first(i) = rs("firstName")
		last(i) = rs("lastName")	
		offence(i) = rs("offenceName")
		court(i) = rs("courtName")	
		courtd(i) = rs("courtdate")
		courtt(i) = rs("courttime")
		i=i+1
		rs.movenext
Loop


'get the q parameter from URL
f=UCase(request.querystring("f"))
l=UCase(request.querystring("l"))
o=UCase(request.querystring("o"))
c=UCase(request.querystring("c"))
d=UCase(request.querystring("d"))
t=UCase(request.querystring("t"))


'lookup all hints from array if length of q>0

response.write "<div class='row'>"  
response.write "<table id='gradient-style' style='width:700px; font-size:12px; border:0px; margin:0; padding-top:0;'>"  
response.write "<thead><tr>"
response.write "<th style='height:17px;padding:0;text-align:left;padding-left:5px;' scope='col'>Name</th>"
response.write "<th style='height:17px;padding:0;text-align:left;padding-left:5px;' scope='col'>Offence</th>"
response.write "<th style='height:17px;padding:0;text-align:left;padding-left:5px;' scope='col'>Court Name</th>"
response.write "<th style='height:17px;padding:0;text-align:left;padding-left:5px;' scope='col'>Court Date</th>"
response.write "<th style='height:17px;padding:0;text-align:left;padding-left:5px;' scope='col'>Court Time</th>"
response.write "<th style='height:17px;padding:0;text-align:left;padding-left:5px;' scope='col'>Edit</th>"
response.write "<th style='height:17px;padding:0;text-align:left;' scope='col'></th>"
response.write "</tr></thead>"
response.write "<tfoot><tr><td colspan='5'></td></tr></tfoot>"

response.write "<tbody>"
  
if len(f)>0 or len(l)>0 or len(o)>0 or len(c)>0 or len(d)>0 or len(t)>0 then
  for i=1 to ubound(first)
      if f = mid(first(i),1,len(f)) and l = mid(last(i),1,len(l)) and o = mid(offence(i),1,len(o)) and c = mid(court(i),1,len(c)) and d = mid(courtd(i),1,len(d)) and t = mid(courtt(i),1,len(t)) then
		response.write "<tr><td style='height:17px; padding:0;'>" & first(i) & " " & last(i) & "</td><td style='height:17px; padding:0;'>" & offence(i) & "</td><td style='height:17px; padding:0;'>" & court(i) & "</td><td style='height:17px; padding:0;'>" & courtd(i) & "</td><td style='height:17px; padding:0;'>" & courtt(i) & "</td><td style='height:17px; padding:0;'><button value='" & id(i) & "' type='button' style='font-size:12px;' onclick='editCourtOrder(this.value)'>Edit</button></td></tr>"
    end if
  next
end if

response.write "</tbody>"
response.write "</table>"
response.write "</div>"

%>
