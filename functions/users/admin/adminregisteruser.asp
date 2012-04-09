<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"[]>

<%
	
	If Session("Authenticated") = 0 or Session("access") <> 1 Then
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
    <title>Add User</title>
    <meta name="description" content="Description" />
    <meta name="keywords" content="Keywords" />
	
    <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
    <!--[if IE 6]><link rel="stylesheet" href="style.ie6.css" type="text/css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" href="style.ie7.css" type="text/css" media="screen" /><![endif]-->

<SCRIPT LANGUAGE="JavaScript">

<!-- This script and many more are available free online at -->
<!-- The JavaScript Source!! http://javascript.internet.com -->
<!-- Created by: Lee Hinder, lee.hinder@ntlworld.com -->

<!-- Begin
//set todays date
Now = new Date();
NowDay = Now.getDate();
NowMonth = Now.getMonth();
NowYear = Now.getYear();
if (NowYear < 2000) NowYear += 1900; //for Netscape

//function for returning how many days there are in a month including leap years
function DaysInMonth(WhichMonth, WhichYear)
{
  var DaysInMonth = 31;
  if (WhichMonth == "Apr" || WhichMonth == "Jun" || WhichMonth == "Sep" || WhichMonth == "Nov") DaysInMonth = 30;
  if (WhichMonth == "Feb" && (WhichYear/4) != Math.floor(WhichYear/4))	DaysInMonth = 28;
  if (WhichMonth == "Feb" && (WhichYear/4) == Math.floor(WhichYear/4))	DaysInMonth = 29;
  return DaysInMonth;
}

//function to change the available days in a months
function ChangeOptionDays(Which)
{
  DaysObject = eval("document.registerForm." + Which + "Day");
  MonthObject = eval("document.registerForm." + Which + "Month");
  YearObject = eval("document.registerForm." + Which + "Year");

  Month = MonthObject[MonthObject.selectedIndex].text;
  Year = YearObject[YearObject.selectedIndex].text;

  DaysForThisSelection = DaysInMonth(Month, Year);
  CurrentDaysInSelection = DaysObject.length;
  if (CurrentDaysInSelection > DaysForThisSelection)
  {
    for (i=0; i<(CurrentDaysInSelection-DaysForThisSelection); i++)
    {
      DaysObject.options[DaysObject.options.length - 1] = null
    }
  }
  if (DaysForThisSelection > CurrentDaysInSelection)
  {
    for (i=0; i<(DaysForThisSelection-CurrentDaysInSelection); i++)
    {
      NewOption = new Option(DaysObject.options.length + 1);
      DaysObject.add(NewOption);
    }
  }
    if (DaysObject.selectedIndex < 0) DaysObject.selectedIndex == 0;
}

//function to set options to today
function SetToToday(Which)
{
  DaysObject = eval("document.registerForm." + Which + "Day");
  MonthObject = eval("document.registerForm." + Which + "Month");
  YearObject = eval("document.registerForm." + Which + "Year");

  YearObject[0].selected = true;
  MonthObject[NowMonth].selected = true;

  ChangeOptionDays(Which);

  DaysObject[NowDay-1].selected = true;
}

//function to write option years plus x
function WriteYearOptions(YearsAhead)
{
  line = "";
  for (i=0; i<YearsAhead; i++)
  {
    line += "<OPTION>";
    line += NowYear - i;
  }
  return line;
}
//  End -->
</script>

	
    <script type="text/javascript" src="jquery.js"></script>
    <script type="text/javascript" src="script.js"></script>
	
	<script type="text/javascript">
	
    window.history.forward();
    function noBack() { window.history.forward(); }   
	
	function validateForm()
	{
		
	let = /[a-z]/;	
	num = /[0-9]/;
	var illegalChars = /[\W_]/;
	
	var id=document.forms["registerForm"]["employeeID"].value;
	if (isNaN(id) || id.length!=6)
		{
		alert("Enter a valid 6 digit numeric Employee ID");
		return false;
		}	
		
	var fn=document.forms["registerForm"]["firstName"].value;
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
		

	var ln=document.forms["registerForm"]["lastName"].value;
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
		
	

	var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
	var em = document.forms["registerForm"]["email"].value;
	if (em==null || em=="" || !filter.test(em))
		{
		alert("Please Enter a valid Email");
		return false;
		}
	
	var opt = document.forms["registerForm"]["Etype"].value;
	if (opt==null || opt=="")
		{
		alert("Please Select an Employee Type");
		return false;
		}
		
	}
	
	
	</script>
		
	</script>
</head>
<BODY onload="noBack();SetToToday('FirstSelect');" onpageshow="if (event.persisted) noBack();" onunload="">
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
						<h1 class="art-logo-name"><a href=""></a></h1>
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
				<a href="./adminchangepassword.asp" ><span class="l"></span><span class="r"></span><span class="t">Change Password</span></a>
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
                    <h3 class="t">Administrator</h3>
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
                Register User
                                </h2>
                <div class="cleared"></div>
                                <div class="art-postcontent">
								
								
								<FORM NAME="registerForm" METHOD=POST ACTION="adminregister.asp" onsubmit="return validateForm()">
								
								<div class="formhead">Personal Information</div>
								
								<div class="row">
								<span class="label">Employee ID:</span><span class="formw"><input type=Integer name="employeeID"></span>
								</div>
								
								<div class="row">
								<span class="label">First Name:</span><span class="formw"><input type=text name="firstName"></span>
								</div>
								
								<div class="row">
								<span class="label">Last Name:</span><span class="formw"><input type=text name="lastName"></span>
								</div>
																					
																
								<div class="row">
								<span class="label">Date Of Birth:</span>
								<SELECT name="FirstSelectDay">
								<OPTION>1</option>
								<OPTION>2</option>
								<OPTION>3</option>
								<OPTION>4</option>
								<OPTION>5</option>
								<OPTION>6</option>
								<OPTION>7</option>
								<OPTION>8</option>
								<OPTION>9</option>
								<OPTION>10</option>
								<OPTION>11</option>
								<OPTION>12</option>
								<OPTION>13</option>
								<OPTION>14</option>
								<OPTION>15</option>
								<OPTION>16</option>
								<OPTION>17</option>
								<OPTION>18</option>
								<OPTION>19</option>
								<OPTION>20</option>
								<OPTION>21</option>
								<OPTION>22</option>
								<OPTION>23</option>
								<OPTION>24</option>
								<OPTION>25</option>
								<OPTION>26</option>
								<OPTION>27</option>
								<OPTION>28</option>
								<OPTION>29</option>
								<OPTION>30</option>
								<OPTION>31</option>
								</SELECT>
								<SELECT name="FirstSelectMonth" onchange="ChangeOptionDays('FirstSelect')">
								<OPTION>Jan</option>
								<OPTION>Feb</option>
								<OPTION>Mar</option>
								<OPTION>Apr</option>
								<OPTION>May</option>
								<OPTION>Jun</option>
								<OPTION>Jul</option>
								<OPTION>Aug</option>
								<OPTION>Sep</option>
								<OPTION>Oct</option>
								<OPTION>Nov</option>
								<OPTION>Dec</option>
								</SELECT>
								<SELECT name="FirstSelectYear" onchange="ChangeOptionDays('FirstSelect')">
								<SCRIPT language="JavaScript">
									document.write(WriteYearOptions(100));
								</SCRIPT>
								</SELECT>
								
								<div class="row">
								<span class="label">Email:</span><span class="formw"><input type=text name="email"></span>
								</div>
								
								<div class="row">
								<span class="label">Employee Type:</span>
								<span class="formw">
								<select name = "Etype">
								<option value = "" >Select Employee Type</option>
								<option value = "POLICE"> Police </option>
								<option value = "COURT"> Court </option>
								</select>
								</div>

								<br><br>
	
								<div class="row">
								<span class="label"></span><span class="formw"><INPUT TYPE=SUBMIT value="Register"></span>
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
