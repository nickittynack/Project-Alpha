
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"[]>
<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="database.asp" -->

<%
	
	If Session("Authenticated") = 0 or Session("access") <> 1 Then
		Session.Timeout=5	
		Session("TimeoutMsg")=1	
		Response.Redirect ("login.asp")	
	End if
		
sql="SELECT * FROM employee where EmployeeID = " & Request.Cookies("adminedituser")

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
    <title>Edit Offence</title>
    <meta name="description" content="Description" />
    <meta name="keywords" content="Keywords" />


    <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
    <!--[if IE 6]><link rel="stylesheet" href="style.ie6.css" type="text/css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" href="style.ie7.css" type="text/css" media="screen" /><![endif]-->
   
	<script type="text/javascript">
	
    window.history.forward();
    function noBack() { window.history.forward(); }   

	function showHint(str)
	{

	var xmlhttp;
		xmlhttp=new XMLHttpRequest();
		if (str=="")
		{
			document.getElementById("emptable").innerHTML="";
			return;
		}		
		xmlhttp.onreadystatechange=function()
		{
			if (xmlhttp.readyState==4 && xmlhttp.status==200)
			{
				document.getElementById("emptable").innerHTML=xmlhttp.responseText;
			}
		}
		
	xmlhttp.open("GET","getpostcode.asp?q="+str,true);
	xmlhttp.send();
	}
	
	function validateForm()
	{
	var fn=document.forms["editform"]["firstn qame"].value;
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
		

	var ln=document.forms["editform"]["lastname"].value;
	if (ln==null || ln=="" )
		{
		alert("Last name must be filled out");
		return false;
		}
	if (ln.length>30)
		{
		alert("Last name is too long");
		return false;
		}	
	
	var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
	var em = document.forms["editForm"]["email"].value;
	if (em==null || em=="" || !filter.test(em))
		{
		alert("Please Enter a valid Email");
		return false;
		}
	
	var opt = document.forms["editform"]["status"].value;
	if (opt==null || opt=="")
		{
		alert("Please Select a Status");
		return false;
		}
	
	}
	
	</script>
</head>
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
				<a href="./adminchangepassword.asp" class="active"><span class="l"></span><span class="r"></span><span class="t">Change Password</span></a>
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
		<a href="./adminregisteruser.asp"><span class="l"></span><span class="r"></span><span class="t">Add User</span></a>
	</li>
	<li>
		<a href="./adminsearchuser.asp"><span class="l"></span><span class="r"></span><span class="t">Search Employees</span></a>
	</li>	
	<li>
		<a href="./adminaddoffence.asp"><span class="l"></span><span class="r"></span><span class="t">Add Offence Type</span></a>
	</li>
	<li>
		<a href="./adminsearchoffence.asp"><span class="l"></span><span class="r"></span><span class="t">Search Offence Type</span></a>
	</li>		
	<li>
		<a href="./adminresetpassword.asp"><span class="l"></span><span class="r"></span><span class="t">Reset User Password</span></a>
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
								Edit Employee
                                </h2>
								<div class="cleared"></div>
                                <div class="art-postcontent">
								
								<FORM NAME="editform" METHOD=POST ACTION="adminedituserconfirm.asp" onsubmit="return validateForm()">
								
								<div class="row">
								<span class="label">First Name</span><span class="formw"><input type=text name="firstname" value='<%= rs("firstname") %>'></span>
								</div>
								
								<div class="row">
								<span class="label">Last Name</span><span class="formw"><input type=text name="lastname" value='<%= rs("lastname") %>'></span>
								</div>

								<div class="row">
								<span class="label">DOB</span><span class="formw"><input type=text name="dob" value='<%= rs("dob") %>'></span>
								</div>						
								
								<div class="row">
								<span class="label">Email:</span><span class="formw"><input type=text name="email" value='<%= rs("email") %>'></span>
								</div>
								
								<div class="row">
								<span class="label">Employee Status:</span>
								<span class="formw">
								<select name = "status">
								<option value = "true" >Active</option>
								<option value = "false"> Inactive </option>
								</select>
								</div>
															
								<br><br>																
															
								<div class="row" style='padding-left:140px'>
								<INPUT TYPE=SUBMIT value="Update Employee">
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

							

