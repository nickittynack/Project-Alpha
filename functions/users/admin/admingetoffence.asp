<!--#include file="database.asp" -->

<%
	
	If Session("Authenticated") = 0 or Session("access") <> 1 Then
		Session.Timeout=5	
		Session("TimeoutMsg")=1	
		Response.Redirect ("login.asp")	
	End if
		


response.expires=-1
sql="SELECT * FROM offencetype"

Set rs = Server.CreateObject("ADODB.RecordSet")	

rs.Open sql, nswjlps_STRING

dim offence(500)
dim fineamount(500)
dim offenceaction(500)

i=1

Do Until rs.EOF	
		'response.write "<p>g" & rs("id") & "</p>"
		offence(i)= UCase(rs("offencename"))
		fineamount(i) = rs("fineamount")
		offenceaction(i) = rs("offenceaction")	
		i=i+1
		rs.movenext
Loop


'get the q parameter from URL
o=UCase(request.querystring("o"))

'lookup all hints from array if length of q>0

response.write "<div class='row'>"  
response.write "<table id='gradient-style' style='width:700px; font-size:12px; border:0px; margin:0; padding-top:0;'>"  
response.write "<thead><tr>"
response.write "<th style='height:17px;padding:0;text-align:left;padding-left:5px;' scope='col'>Offence Name:</th>"
response.write "<th style='height:17px;padding:0;text-align:left;padding-left:5px;' scope='col'>Fine Amount:</th>"
response.write "<th style='height:17px;padding:0;text-align:left;padding-left:5px;' scope='col'>Offence Action:</th>"
response.write "<th style='height:17px;padding:0;text-align:left;padding-left:5px;' scope='col'>Edit:</th>"
response.write "</tr></thead>"
response.write "<tfoot><tr><td colspan='5'></td></tr></tfoot>"

response.write "<tbody>"
  
if len(o)>0 then
  for i=1 to ubound(offence)
																																		
      if o = mid(offence(i),1,len(o)) then
		response.write "<tr><td style='height:17px; padding:0;'>" & offence(i) & "<td style='height:17px; padding:0;'>$"  & fineamount(i) & "<td style='height:17px; padding:0;'>" & offenceaction(i) & "</td><td><button value='" & offence(i) & "'type='button' style='font-size:8px;' onclick='editOffence(this.value)'>Edit</button></td></tr>"
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