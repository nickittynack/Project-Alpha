
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"[]>
<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>



<%
	
	If Session("Authenticated") = 0 or Session("access") <> 2 Then
		Session.Timeout=5	
		Session("TimeoutMsg")=1	
		Response.Redirect ("login.asp")	
	End if
		



	set conn=Server.CreateObject("ADODB.Connection")
	conn.Provider="Microsoft.Jet.OLEDB.4.0"
	conn.Open "C:\inetpub\wwwroot\nswjlps\nswjlps.mdb"		
	
	fn = UCase(Request.Form("firstname"))
	ln = UCase(Request.Form("lastname")) 
	str = UCase(Request.Form("street"))
	subb = UCase(Request.Form("suburb"))
	post = Request.Form("postcode")
	st = UCase(Request.Form("state"))
	
	ema = UCase(Request.Form("email"))
	if IsEmpty(ema) then
		ema = ""
	end if
	
	ph = Request.Form("phone")
	
	lic = Request.Form("licence")
	if IsEmpty(lic) then
		lic = ""
	end if
		
		
	id = Request.Cookies("policeeditcrimid")
	
	
	
	sql="UPDATE criminal SET "
	sql=sql & "firstname='" & fn & "',"
	sql=sql & "lastname='" & ln & "',"
	sql=sql & "streetaddress='" & str & "',"
	sql=sql & "suburb='" & subb & "',"
	sql=sql & "postcode=" & post & ","
	sql=sql & "state='" & st & "',"
	sql=sql & "email='" & ema & "',"
	sql=sql & "phonenumber='" & ph & "',"	
	sql=sql & "licencenumber='" & lic & "'"
	sql=sql & " WHERE ID=" & id
  
	conn.Execute sql
	
	
				
	%>
	
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US" xml:lang="en">
<head><LINK REL="SHORTCUT ICON" href="images/favicon.ico">
    <!--
    Created by Artisteer v3.0.0.39952
    Base template (without user's data) checked by http://validator.w3.org : "This page is valid XHTML 1.0 Transitional"
    -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Edit Criminal Confirmation</title>
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
                    <h3 class="t">Vertical Menu</h3>
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
								Criminal Details have been Updated 
                                </h2>
                <div class="cleared"></div>
                                <div class="art-postcontent">
									
									
							<p>The criminal details have been successfully updated.<br><br>
								Here are the updated details:<br><br>
								
								<div class="row">
								<span class="label">Criminal ID</span><span class="formw"> <%= id %></span>
								</div>
															
								<div class="row">
								<span class="label">Name:</span><span class="formw"> <%= fn %> &nbsp <%= ln %> </span>
								</div>
								
								<div class="row">
								<span class="label">Address:</span><span class="formw">  <%= str %></span>
								</div>
								
								<div class="row">
										<span class="formw" style="padding-left:140px"><%= subb %>, &nbsp <%= st %> &nbsp &nbsp <%= post %></span>
								</div>
								
								<div class="row">
								
								<span class="label">Phone number:</span><span class="formw"> <%= ph %> </span>
								</div>
																
								
								<div class="row">
								<span class="label">Email:</span><span class="formw"> <%= ema %> </span>
								</div>
								
								<div class="row">
								<span class="label">Licence Number:</span><span class="formw"> <%= lic %> </span>
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

							

