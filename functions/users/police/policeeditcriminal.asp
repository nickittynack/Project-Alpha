
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"[]>
<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="database.asp" -->
<!--#INCLUDE FILE="clsUpload.asp"-->

<%
	
	If Session("Authenticated") = 0 or Session("access") <> 2 Then
		Session.Timeout=5	
		Session("TimeoutMsg")=1	
		Response.Redirect ("login.asp")	
	End if		

	sql="SELECT * FROM criminal where id = " & Request.Cookies("policeeditcrimid") 

	Set rs = Server.CreateObject("ADODB.RecordSet")	

	rs.Open sql, nswjlps_STRING


%>


<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US" xml:lang="en">
<head><LINK REL="SHORTCUT ICON" href="images/favicon.ico">
    <!--
    Created by Artisteer v3.0.0.39952
    Base template (without user's data) checked by http://validator.w3.org : "This page is valid XHTML 1.0 Transitional"
    -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Edit Criminal</title>
    <meta name="description" content="Description" />
    <meta name="keywords" content="Keywords" />


    <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
    <!--[if IE 6]><link rel="stylesheet" href="style.ie6.css" type="text/css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" href="style.ie7.css" type="text/css" media="screen" /><![endif]-->
   
	<script type="text/javascript">
	
	
	
	function showHint(str)
	{
	document.getElementById("suburbshow").value= "";
	document.getElementById("stateshow").value= "";
	var xmlhttp;
		xmlhttp=new XMLHttpRequest();
		if (str=="")
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
		
	xmlhttp.open("GET","getpostcode.asp?q="+str,true);
	xmlhttp.send();
	}
	
	function loadSuburb(substate)
	{
		a = substate.split(",");
		showHint("");
		document.getElementById("suburbshow").value= a[1];
		document.getElementById("stateshow").value= a[2];
		document.getElementById("suburb").value= a[1];
		document.getElementById("state").value= a[2];			
		document.getElementById("postcode").value= a[0];
		
	}
	
	
	
	
	function validateForm()
	{
			
			
	var fn=document.forms["addoffender"]["firstname"].value;
	if (fn==null || fn=="")
		{
		alert("First name must be filled out");
		return false;
		}		
	if (fn.length>30)
		{
		alert("First name is too long");
		return false;
		}		

	var ln=document.forms["addoffender"]["lastname"].value;
	if (ln==null || ln=="")
		{
		alert("Last name must be filled out");
		return false;
		}
	if (ln.length>30)
		{
		alert("Last name is too long");
		return false;
		}	
	
	var stnm=document.forms["addoffender"]["street"].value;
	if (stnm==null || stnm=="")
		{
		alert("Street name must be filled out");
		return false;
		}
	if (stnm.length>40)
		{
		alert("Street name must be a maximum of 40 characters");
		return false;
		}
	
	var pc=document.forms["addoffender"]["postcode"].value;
	if (isNaN(pc) || pc.length!=4)
		{
		alert("Enter a valid 4 digit postcode");
		return false;
		}
		
			
	var sub=document.forms["addoffender"]["suburb"].value;
	if (sub==null || sub=="")
		{
		alert("Suburb must be filled out");
		return false;
		}
		
	var stat=document.forms["addoffender"]["state"].value;
	if (stat==null || stat=="")
		{
		alert("State must be filled out");
		return false;
		}
		
	
	var lic=document.forms["addoffender"]["licence"].value;
	if (lic==null || lic=="")
	{
		var r=confirm("Are you sure you want to keep the licence number field empty?");
		if (r!=true)
			return false;			
	}
	
	
	else
	{
		if (isNaN(lic) || lic.length!=8)
		{
		alert("Enter a valid 8 digit licence number.");
		return false;
		}	
	}		
		
	var ph=document.forms["addoffender"]["phone"].value;
	if (isNaN(ph) || ph.length!=10)
		{
		alert("Enter a valid 10 digit phone number.");
		return false;
		}
		
		
	var email=document.forms["addoffender"]["email"].value;
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    
	if (email==null || email=="")
	{
		var r=confirm("Are you sure you want to keep the email field empty?");
		if (r!=true)
			return false;
	}
	else
	{
		if (!re.test(email))
		{
		alert("Enter a valid email address.");
		return false;
		}
	}
	
	var r=confirm("Are you sure you would like to edit these criminal details?");
		if (r!=true)
			return false;
	
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
		<a href="./policesearchoffence.asp" ><span class="l"></span><span class="r"></span><span class="t">Search/Edit Offence</span></a>
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
								Edit Criminal
                                </h2>
								<div class="cleared"></div>
                                <div class="art-postcontent">
								
								<div class="row" style="padding-left:70px;">
								<%
								dim fs
								set fs=Server.CreateObject("Scripting.FileSystemObject")
								if fs.FileExists("C:\inetpub\wwwroot\nswjlps\uploads\" + Request.Cookies("policeeditcrimid") + ".jpg")=true then
									response.write"<img style='height:220px;' src='uploads\" + Request.Cookies("policeeditcrimid") + ".jpg' alt='no image available'/>"
								else
									response.write"<img style='height:220px;' src='uploads\default.jpg' alt='no image available'/>"	
								end if
								set fs=nothing
								%> 
															
								
								</div>
								
								<div class="row" style="padding-left:20px;">							
								<FORM method="post" encType="multipart/form-data" action="policeaddphoto.asp">
									<INPUT type="File" name="File1">
									<INPUT type="Submit" value="Upload">
								</FORM>
								</div>
								<br>
								
								<FORM NAME="addoffender" METHOD=POST ACTION="policeeditcriminalconfirm.asp" onsubmit="return validateForm()">
																							
								<div class="row">
								<span class="label">First Name</span><span class="formw"><input type=text name="firstname" value='<%= rs("firstname") %>'></span>
								</div>
								
								<div class="row">
								<span class="label">Last Name</span><span class="formw"><input type=text name="lastname" value='<%= rs("lastname") %>'></span>
								</div>
																
								<div class="row">
								<span class="label">Street Address</span><span class="formw"><input type=text name="street" value='<%= rs("streetaddress") %>'></span>
								</div>
								
								<div class="row">
								<span class="label">Postcode</span><span class="formw"><input type="text" name="postcode" id="postcode" autocomplete="off" value='<%= rs("postcode") %>' onkeyup="showHint(this.value)"/></span>
								</div>
								
								<div id="pctable"></div>
								

								<div class="row">
								<span class="label">Suburb</span><span class="formw"><input type="text" disabled="disabled" name="suburbshow" id="suburbshow" value='<%= rs("suburb") %>'></span>
								<input type="hidden" id="suburb" name="suburb" value='<%= rs("suburb") %>'>
								</div>
								
								<!-- suburb and state have hidden fields since disabled textfields are not sent to the server -->
								
								<div class="row">
								<span class="label">State</span><span class="formw"><input type=text disabled="disabled" name="stateshow" id="stateshow" value='<%= rs("state") %>'></span>
								<input type="hidden" id="state" name="state" value='<%= rs("state") %>'>
								</div>
								
								<div class="row">
								<span class="label">Licence No (opt)</span><span class="formw"><input type=text name="licence" value='<%= rs("licenceNumber") %>'></span>
								</div>
																
								
								<div class="row">
								<span class="label">Phone</span><span class="formw"><input type=text name="phone" value='<%= rs("phoneNumber") %>'></span>
								</div>
								
								<div class="row">
								<span class="label">Email (opt)</span><span class="formw"><input type=text name="email" value='<%= rs("email") %>'></span>
								</div>
																				
															
								<div class="row" style='padding-left:140px'>
								<INPUT TYPE=SUBMIT value="Update Criminal Details">
								</div>
								
								</form>	
			
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

							

