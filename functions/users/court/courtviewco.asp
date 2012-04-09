<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"[]>
<%
	
	If Session("Authenticated") = 0 or Session("access") <> 3 Then
		Session.Timeout=5	
		Session("TimeoutMsg")=1	
		Response.Redirect ("login.asp")	
	End if
		

%>
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US" xml:lang="en">
<head><LINK REL="SHORTCUT ICON" href="images/favicon.ico">
    <!--Created by Artisteer v3.0.0.39952
    Base template (without user's data) checked by http://validator.w3.org : "This page is valid XHTML 1.0 Transitional"-->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title> View Court Order </title>
    <meta name="description" content="Description" />
    <meta name="keywords" content="Keywords" />

    <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
    <!--[if IE 6]><link rel="stylesheet" href="style.ie6.css" type="text/css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" href="style.ie7.css" type="text/css" media="screen" /><![endif]-->

    <script type="text/javascript" src="jquery.js"></script>
    <script type="text/javascript" src="script.js"></script>
	<script type="text/javascript">
	window.history.forward();
	function noBack()
	{
		windown.history.forward();
	}	
	
	function validateForm()
	{	
	
	var un=document.forms["loginForm"]["username"].value;
	let = /[a-z]/;	
	num = /[0-9]/;
	var illegalChars = /[\W_]/;
	if (un.length<6)
		{
		alert("Username must be at least 6 characters");
		return false;
		}	
	if(!num.test(un)) 
		{	
        alert("Username must contain numerals only.");
		return false;
		}	
	if (illegalChars.test(un)) 
		{
		alert("Username contains invalid symbols.");
		return false;
		}
	if (un.length>20)
		{
		alert("Username must be a maximum of 20 characters");
		return false;
		}	
		
	
	var ps1=document.forms["loginForm"]["password1"].value;	
	if (ps1.length<6)
		{
		alert("Password must be at least 6 characters");
		return false;
		}	
	if(!num.test(ps1) || !let.test(ps1)) 
		{	
        alert("Password must contain letters and numerals.");
		return false;
		}	
	if (illegalChars.test(ps1)) 
		{
		alert("Password contains invalid symbols.");
		return false;
		}
	if (ps1.length>20)
		{
		alert("Password must be a maximum of 20 characters");
		return false;
		}	
	}
</script>
</head>
		<body onload = "noBack();" onpageshow = "if (event.persisted)noBack();" onunload="">
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
			<h1 class="art-logo-name"></h1>
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
				<a href="./courtchangepassword.asp" class="active"><span class="l"></span><span class="r"></span><span class="t">Change Password</span></a>
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
            <h3 class="t">Court Menu</h3>
        </div>
        <div class="art-vmenublockcontent">
        <div class="art-vmenublockcontent-body">
		<ul class="art-vmenu">
			<li>
				<a href="./courthome.asp"><span class="l"></span><span class="r"></span><span class="t">Court Home</span></a>
			</li>
			<li>
				<a href="./courtaddcoverdict.asp"><span class="l"></span><span class="r"></span><span class="t">Add Verdict</span></a>
			</li>
			<li>
				<a href="./courtsearch.asp"><span class="l"></span><span class="r"></span><span class="t">Search Court Order</span></a>
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
			<h2 class="art-postheader"> Search Court Order </h2>
		<div class="cleared"></div>
        <div class="art-postcontent">
			
		<FORM NAME="viewCourtOrder" METHOD=POST ACTION="update.asp" onsubmit="return validateForm()">								
		
			<div class="row">
			<span class="label">Offender First Name:</span><span class="formw"><input type=text name="firstname"></span>
			</div>
								
			<div class="row">
			<span class="label">Offender Last Name:</span><span class="formw"><input type=text name="lastname"></span>
			</div>
								
			<div class="row">
			<span class="label">Court Date:</span><span class="formw"><input type=text name="courtdate"></span>
			</div>
								
			<div class="row">
			<span class="label">Court Time:</span><span class="formw"><input type=text name="courttime"></span>
			</div>
								
			<div class="row">
			<span class="label">Court Name:</span><span class="formw"><input type=text name="courtname"></span>
			</div>
								
			<div class="row">
			<span class="label"></span><span class="formw"><INPUT TYPE=SUBMIT value="Search"></span>
			</div>
								
			</div>
								
		</form>
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
			<p><a href="./logout.asp">Logout</a> | <a href="./courtchangepassword.asp">Change Password</a></p><p>Copyright 2011. All Rights Reserved.</p>
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
