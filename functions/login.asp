<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"[]>

<%
	If Session("ActiveService") = 1	 Then
		errorMessage  = "The user account is not active"
		Session("ActiveService") = 0
	Else If Session("LoginError") = 1 Then
		errorMessage  = "Username or password not found"
		Session("LoginError") = 0
	Else if Session("TimeoutMsg") = 1 Then
		errorMessage  = "User session is not valid. Please login."
		Session("TimeoutMsg") = 0
	End If
	end if
	End if
	

%>

<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US" xml:lang="en">
<head><LINK REL="SHORTCUT ICON" href="images/favicon.ico">
   <LINK REL="SHORTCUT ICON" href="images/favicon.ico">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Login</title>
    <meta name="description" content="Description" />
    <meta name="keywords" content="Keywords" />


    <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
  
	<script type="text/javascript">
	
	function validateForm()
	{	
	
	var un=document.forms["loginForm"]["employeeID"].value;
	let = /[a-z]/;	
	num = /[0-9]/;
	var illegalChars = /[\W_]/;
	
	if (un.length<6)
		{
		alert("Username must be at least 6 characters");
		return false;
		}	
	if(isNaN(un)) 
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
<body>
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
		
	</ul>
</div>
</div>
<div class="cleared reset-box"></div>
<div class="art-content-layout">
                <div class="art-content-layout-row">
                    <div class="art-layout-cell art-sidebar1">


                      <div class="cleared"></div>
                    </div>
                    <div class="art-layout-cell art-content">
<div class="art-post">
    <div class="art-post-body">
<div class="art-post-inner art-article">
                                <h2 class="art-postheader">
                Login
                                </h2>
                <div class="cleared"></div>
                                <div class="art-postcontent">								
								
								<FORM NAME="loginForm" METHOD=POST ACTION="verify.asp" onsubmit="return validateForm()">								
																
								<div class="row">
								<span class="label">Employee ID</span><span class="formw"><input type=text name="employeeID"></span>
								</div>
								
								<div class="row">
								<span class="label">Password</span><span class="formw"><input type=password name="password1"></span>
								</div>													
								
								<br><br>
								
								<div class="row" style="color:red; padding-left:120px;"><%=errorMessage%></div>
														
								<br>
								
								<div class="row">
								<span class="label" style='padding-left:80px'><INPUT TYPE=SUBMIT value="Login"></span>
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
			<p>Copyright 2011. All Rights Reserved.</p>
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
