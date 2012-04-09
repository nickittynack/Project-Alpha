
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"[]>
<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>

<!--#include file="database.asp" -->

<%
	
	
	If Session("Authenticated") = 0 or Session("access") <> 2 Then
		Session.Timeout=5	
		Session("TimeoutMsg")=1	
		Response.Redirect ("login.asp")	
	End if
		

	
	offenceName = UCase(Request.Form("offencetype"))	
	offsuburb = UCase(Request.Form("offSuburb"))		
	
	comment = UCase(Request.Form("comment"))
	firstname = UCase(Request.Form("firstname"))
	lastname = UCase(Request.Form("lastname"))
	
	offdate = CStr(Request.Form("FirstSelectDay")) + "/" + Request.Form("FirstSelectMonth") + "/" + CStr(Request.Form("FirstSelectYear"))
	
	street = UCase(Request.Form("street"))
	suburb = UCase(Request.Form("suburb"))
	state = UCase(Request.Form("state"))
	postcode = Request.Form("postcode")
	
	dob = CStr(Request.Form("SecondSelectDay")) + "/" + Request.Form("SecondSelectMonth") + "/" + CStr(Request.Form("SecondSelectYear"))
	
	phone = Request.Form("phone")
	
	
	'if (isEmp(Request.Form("licenceno"))) then
	'	licenceno = "d"
	'else
		licenceno = Request.Form("licenceno")
	'end if
	
	
	'if (isNull(Request.Form("email"))) then
	'	email = "d"
	'else
		email = UCase(Request.Form("email"))
	'end if
	
		
		
	if Session("pAddOffenceAction") = "1" Then
		status = "waiting for fine payment"
	end if
	
	if Session("pAddOffenceAction") = "2" Then
		status = "court date pending - no fine"
	end if
	
	if Session("pAddOffenceAction") = "3" Then
		status = "court date pending - fine"
	end if
	
	Dim rstContent
	Set rstContent = Server.CreateObject("ADODB.RecordSet")		
	getMaxID = "select max(ID) as maxid from offence;"	
	rstContent.Open getMaxID, nswjlps_STRING
	
	Dim maxid
	If (IsNull(rstContent("maxid")) Or IsEmpty(rstContent("maxid"))) Then
		maxid = 100000
	Else 
		maxid = CLng(rstContent("maxid"))+1
	End If
		
	Dim offenceIDstring
	offenceIDstring = Cstr(maxid)
	
	rstContent.Close()
	Set rstContent = Nothing
	
	'addedbyPoliceID = Session("username")
	Dim objConn
	Set objConn = Server.CreateObject("ADODB.Connection")
	objConn.Provider="Microsoft.Jet.OLEDB.4.0"
	objConn.Open "C:\inetpub\wwwroot\nswjlps\nswjlps.mdb"
	
	strSQL = "INSERT INTO offence (offenceName, status, OffenceSuburb, OffenceDate, firstname, lastname, comment, OffenderAddress, OffenderSuburb, Offenderstate, offenderemail, licencenumber, Offenderpostcode, DOB, Offenderphone) " _
		& "VALUES ('" & offenceName & "', '" & status & "', '" & offsuburb & "', '" & offdate & "', '" & firstname & "','" & lastname & "', '" & comment & "', '" & street & "'," _		
		& " '" & suburb & "', '" & state & "', '" & email & "', '" & licenceno & "'," & postcode & ", '" & dob & "', '" & phone & "');"
		
		
	'strSQL = "INSERT INTO offence (offenceName, status, OffenceSuburb, firstname, lastname, comment, OffenderSuburb, Offenderstate, Offenderpostcode, LicenceNumber, Offenderphone, Offenderemail) " _
	'	& "VALUES ('" & offenceName & "', '" & status & "', '" & offsuburb & "', '" & firstname & "','" & lastname & "', '" & comment & "', " _		
	'	& " '" & suburb & "', '" & state & "', " & postcode & ", '" & licenceno & "', '" & phone & "', '" & email & "');"
		
	
		objConn.Execute(strSQL)
		'objConn.Close()
		'Set objConn = Nothing	
		
		
	if Session("pAddOffenceAction") <> "1" Then
		
		Set objConn = Server.CreateObject("ADODB.Connection")
		objConn.Open nswjlps_STRING
		courtName = Request.Form("courtname")
	
		courtorderSQL = "INSERT INTO CourtOrder (offenceid, courtName, courtStatus) " _
		& "VALUES (" & maxid & ", '" & courtName & "', 'court date pending');"
				
		objConn.Execute(courtorderSQL)
		
	end if
	
	
			
	%>
	
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US" xml:lang="en">
<head><LINK REL="SHORTCUT ICON" href="images/favicon.ico">
    <!--
    Created by Artisteer v3.0.0.39952
    Base template (without user's data) checked by http://validator.w3.org : "This page is valid XHTML 1.0 Transitional"
    -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Add Offence</title>
    <meta name="description" content="Description" />
    <meta name="keywords" content="Keywords" />


    <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
    <!--[if IE 6]><link rel="stylesheet" href="style.ie6.css" type="text/css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" href="style.ie7.css" type="text/css" media="screen" /><![endif]-->
   
	<script type="text/javascript">
	
	
    window.history.forward();
    function noBack() { window.history.forward(); }
   
</SCRIPT>

</HEAD>

<BODY onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
<div id="art-page-background-glare">
    <div id="art-page-background-glare-image"> </div>
</div>
<div id="art-main">
    <div class="art-sheet">
        <div class="art-sheet-tl"></div>
        <div class="art-sheet-tr"></div>
        <div class="art-sheet-bl"></div>
        <div class="art-sheet-br"></div>
        <div class="art-sheet-tc"></div>
        <div class="art-sheet-bc"></div>
        <div class="art-sheet-cl"></div>
        <div class="art-sheet-cr"></div>
        <div class="art-sheet-cc"></div>
        <div class="art-sheet-body">
            <div class="art-header">
                <div class="art-header-clip">
                <div class="art-header-center">
                    <div class="art-header-jpeg"></div>
                </div>
                </div>
                <div class="art-logo">
                                 <h1 class="art-logo-name"><a href="./index.asp"></a></h1>
                                                 <h2 class="art-logo-text"></h2>
                                </div>
            </div>
            <div class="cleared reset-box"></div>
<div class="art-nav">
	<div class="art-nav-l"></div>
	<div class="art-nav-r"></div>
<div class="art-nav-outer">
	<ul class="art-hmenu">
		<li>
			<a href="./logout.asp" class="active"><span class="l"></span><span class="r"></span><span class="t">Log Out</span></a>
		</li>	
		<li>
			<a href="./policechangepassword.asp" class="active"><span class="l"></span><span class="r"></span><span class="t">Change Password</span></a>
		</li>		
	</ul>
</div>
</div>
<div class="cleared reset-box"></div>
<div class="art-content-layout">
                <div class="art-content-layout-row">
                    <div class="art-layout-cell art-sidebar1">
<div class="art-vmenublock">
    <div class="art-vmenublock-tl"></div>
    <div class="art-vmenublock-tr"></div>
    <div class="art-vmenublock-bl"></div>
    <div class="art-vmenublock-br"></div>
    <div class="art-vmenublock-tc"></div>
    <div class="art-vmenublock-bc"></div>
    <div class="art-vmenublock-cl"></div>
    <div class="art-vmenublock-cr"></div>
    <div class="art-vmenublock-cc"></div>
    <div class="art-vmenublock-body">
                <div class="art-vmenublockheader">
                    <div class="l"></div>
                    <div class="r"></div>
                    <h3 class="t">Police Menu</h3>
                </div>
                <div class="art-vmenublockcontent">
                    <div class="art-vmenublockcontent-body">
                <ul class="art-vmenu">
	<li>
		<a href="./policeaddoffence.asp"><span class="l"></span><span class="r"></span><span class="t">Add Offence</span></a>
	</li>	
	<li>
		<a href="./policesearchoffence.asp"><span class="l"></span><span class="r"></span><span class="t">Search/Edit Offence</span></a>
	</li>	
	<li>
		<a href="./policesearchcriminal.asp"><span class="l"></span><span class="r"></span><span class="t">Search/Edit Criminal</span></a>
	</li>	
</ul>
                
                                		<div class="cleared"></div>
                    </div>
                </div>
		<div class="cleared"></div>
    </div>
</div>

                      <div class="cleared"></div>
                    </div>
                    <div class="art-layout-cell art-content">
<div class="art-post">
    <div class="art-post-body">
<div class="art-post-inner art-article">
                                <h2 class="art-postheader">
								Offence Added
                                </h2>
                <div class="cleared"></div>
                                <div class="art-postcontent">
								
											
								<p>The offence has successfully been added to the database.<br><br>
								The offence number is: <b><%= maxid %></b><br><br>
								
								<h3 class="art-postheader">Offence Details</h3>
								
								<div class="row">								
								<span class="label">Offence:</span><span class="formw"><%= offenceName %></span>
								</div>														
								
								
								<div class="row">	
								<span class="label">Offence Suburb:</span> <span class="formw"><%= offsuburb %></span>
								</div>
								
								<div class="row">
								<span class="label">Offence Date:</span><span class="formw"> <%= offdate %>
								</div>
								
								<div class="row">
								<span class="label">Comments: </span><span class="formw"><%= comment %></span>
								</div>
								
								<br><br>
								
								<h3 class="art-postheader">Offender Details</h3>
								
								
								<div class="row">
								<span class="label">Name:</span><span class="formw"> <%= firstname %> &nbsp <%= lastname %> </span>
								</div>
								
								<div class="row">
								<span class="label">Address:</span><span class="formw">  <%= street %></span>
								</div>
								
								<div class="row">
										<span class="formw" style="padding-left:140px"><%= suburb %>, &nbsp <%= state %> &nbsp &nbsp <%= postcode %></span>
								</div>
								
								<div class="row">
								
								<span class="label">Phone number:</span><span class="formw"> <%= phone %> </span>
								</div>
								
								<div class="row">
								<span class="label">Date of Birth:</span><span class="formw"> <%= dob %> </span>
								</div>
								
								<div class="row">
								<span class="label">Email:</span><span class="formw"> <%= email %> </span>
								</div>
								
								<div class="row">
								<span class="label">Licence Number:</span><span class="formw"> <%= licenceno %> </span>
								</div>
								
								<br><br><br>	
															
						</div>
						
                <div class="cleared"></div>
                </div>

		<div class="cleared"></div>
    </div>
</div>

                      <div class="cleared"></div>
                    </div>
                </div>
            </div>
        <div class="cleared"></div>
        <div class="art-footer">
        <div class="art-footer-t"></div>
        <div class="art-footer-l"></div>
        <div class="art-footer-b"></div>
        <div class="art-footer-r"></div>
        <div class="art-footer-body">
        <div class="art-footer-text">
			<p><a href="./logout.asp">Logout</a> | <a href="./policechangepassword.asp">Change Password</a></p><p>Copyright 2011. All Rights Reserved.</p>
        </div>
        <div class="cleared"></div>
        </div>
        </div>
    	<div class="cleared"></div>
        </div>
		</div>
		<div class="cleared"></div>
		</div>
	</body>
</html>

							

