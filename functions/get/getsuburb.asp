
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"[]>
<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>

<!--#include file="database.asp" -->

<%
	
	If Session("Authenticated") = 0 or Session("access") <> 2 Then
		Session.Timeout=5	
		Session("TimeoutMsg")=1	
		Response.Redirect ("login.asp")	
	End if		



response.expires=-1

sql="SELECT suburb, postcode from postcode where state = 'NSW'"
' WHERE post = '" & request.querystring("q") & "'"

Set rs = Server.CreateObject("ADODB.RecordSet")	


'get the q parameter from URL
q=UCase(request.querystring("q"))

'lookup all hints from array if length of q>0

response.write "<div class='row' style='padding-top:0px; padding-left:50px; '>"  
response.write "<table id='gradient-style' style='width:300px; font-size:12px; border:0px; margin:0; padding-top:0;'>"   
response.write "<tbody>"


  
if len(q)>0 then
	rs.Open sql, nswjlps_STRING
	
	dim a(20000)
	dim b(20000)
	
	i=1
	Do Until rs.EOF	
		a(i) = rs("suburb")		
		b(i) = rs("postcode")	
		i=i+1
		rs.movenext	
	Loop

  for i=1 to ubound(a)
    if q = mid(a(i),1,len(q)) then
		response.write "<tr><td style='height:17px; padding:0;'>" & a(i) & ", " & b(i) & "</td><td style='height:17px; padding:0;'><button value='" & a(i) & "' type='button' style='font-size:8px;' onclick='loadOffSuburb(this.value)' >Select</button></td></tr>"
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