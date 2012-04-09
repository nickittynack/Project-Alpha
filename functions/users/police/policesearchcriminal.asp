
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"[]>
<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="database.asp" -->

<%
	
	If Session("Authenticated") = 0 or Session("access") <> 2 Then
		Session.Timeout=5	
		Session("TimeoutMsg")=1	
		Response.Redirect ("login.asp")	
	End if
		

%>
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US" xml:lang="en">
<head><LINK REL="SHORTCUT ICON" href="images/favicon.ico">
    <!--
    Created by Artisteer v3.0.0.39952
    Base template (without user's data) checked by http://validator.w3.org : "This page is valid XHTML 1.0 Transitional"
    -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Search Criminal</title>
    <meta name="description" content="Description" />
    <meta name="keywords" content="Keywords" />


    <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
    <!--[if IE 6]><link rel="stylesheet" href="style.ie6.css" type="text/css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" href="style.ie7.css" type="text/css" media="screen" /><![endif]-->
   
	<script type="text/javascript">
	
	function showHint()
	{
	var xmlhttp;
		xmlhttp=new XMLHttpRequest();
		first = document.getElementById("firstname").value
		last = document.getElementById("lastname").value		
		suburb = document.getElementById("suburb").value
		state = document.getElementById("state").value
		licence = document.getElementById("licence").value
		
		if (last=="" && first=="" && suburb=="" && state=="" && licence=="")
		{
			document.getElementById("pctable").innerHTML="";
			return;
		}
		
		xmlhttp.onreadystatechange=function()
		{
			if (xmlhttp.readyState==4 && xmlhttp.status==200)
			{
				document.getElementById("pctable").innerHTML=xmlhttp.responseText;
			}
		}
		
	xmlhttp.open("GET","getcriminal.asp?f="+first+"&l="+last+"&sb="+suburb+"&st="+state+"&lc="+licence ,true);
	xmlhttp.send();
	}
	
	
	var exdays=60;
	var exdate=new Date();
	exdate.setDate(exdate.getDate() + exdays);
	
	function setCookie(c_name,value)
	{	
		var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
		document.cookie=c_name + "=" + c_value;
	}
	
	function editCriminal(crimid)
	{
		setCookie("policeeditcrimid",crimid)
		window.location = "policeeditcriminal.asp"
	}
	
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
								Search Criminal
                                </h2>
								<div class="cleared"></div>
                                <div class="art-postcontent">
								
								<!-- <FORM NAME="addoffender" METHOD=POST ACTION="policeaddoffenceconfirm.asp"> <!-- onsubmit="return validateForm()"> -->
								<h3 class="art-postheader">Search Parameters</h3>															

								<div class="row">
								<span class="label">Licence Number</span><span class="formw"><input type="text" name="licence" id="licence" autocomplete="off" onkeyup="showHint()"/></span>
								</div>
								
								<div class="row">
								<span class="label">First Name</span><span class="formw"><input type="text" name="firstname" id="firstname" autocomplete="off" onkeyup="showHint()"/></span>
								</div>
								
								<div class="row">
								<span class="label">Last Name</span><span class="formw"><input type="text" name="lastname" id="lastname" autocomplete="off" onkeyup="showHint()"/></span>
								</div>	
								
								<div class="row">
								<span class="label">Suburb</span><span class="formw"><input type="text" name="suburb" id="suburb" autocomplete="off" onkeyup="showHint()"/></span>
								</div>
								
								<div class="row"><span class="label">State</span>
								
								<span class="formw">
								<select name="state" id="state" onchange="showHint()">
									<option value = "" >Select State</option>
									<option value = "NSW" >NSW</option>
									<option value = "ACT" >ACT</option>
									<option value = "QLD" >QLD</option>
									<option value = "VIC" >VIC</option>
									<option value = "WA" >WA</option>
									<option value = "NT" >NT</option>
									<option value = "TAS" >TAS</option>
								</select>
								</span>
								
								
								
								<!-- <span class="label">State</span><span class="formw"><input type="text" name="state" id="state" autocomplete="off" onkeyup="showHint()"/></span> -->
								</div>
								
								<br><br>
								
								<div id="pctable"></div>
								
								<!-- 								
								<div class="row" style='padding-left:140px'>
								<INPUT TYPE=SUBMIT value="Add Offence">
								</div>
								
								</form>		
								
								-->
			
        </tr>
    </tbody>
</table>								
															
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

							

