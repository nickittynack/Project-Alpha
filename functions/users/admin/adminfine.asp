<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"[]>

<!-- 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"[]>
-->

<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="database.asp" -->
<!--#include file="md5.asp"-->
<!--#include file="functions.asp"-->

<!--
    METADATA
    TYPE="typelib"
    UUID="CD000000-8B95-11D1-82DB-00C04FB1625D" 
    NAME="CDO for Windows 2000 Library"
--> 

<%
	If Session("Authenticated") = 0 Then
		Session.Timeout=5	
		Session("TimeoutMsg")=1	
		Response.Redirect ("login.asp")	
	End if
		
	Dim rstContent
	Set rstContent = Server.CreateObject("ADODB.RecordSet")	
	
	checkSQL = "select offence from OffenceType where offence = '" & Request.Form("offence") & "';"	
	
	rstContent.Open checkSQL, nswjlps_STRING
	
	If rstContent.EOF Then ' no recs	
	
		Dim offenceName, fineAmount, courtOrder
		
		offenceName = Request.Form("offence")
		fineAmount = UCase(Request.Form("fineamount"))
		courtOrder = UCase(Request.Form("courtorder"))
	
		Dim objConn
		Set objConn = Server.CreateObject("ADODB.Connection")
		objConn.Open nswjlps_STRING
		strSQL = "INSERT INTO OffenceType (offence, fineAmount, courtOrder) " _
		& "VALUES ('" & offenceName& "', '" & FineAmount & "', '" & courtOrder & "');"
	
		objConn.Execute(strSQL)
		objConn.Close()
		Set objConn = Nothing
	
	Else
		Session.Timeout=5	
		Session("RegisterError")=1	
		Response.Redirect("adminaddfine.asp")
		
	End If
 
	rstContent.Close()
	Set rstContent = Nothing  
	Response.Redirect("adminaddfine.asp")

%>