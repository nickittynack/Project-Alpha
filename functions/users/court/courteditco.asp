
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"[]>
<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="database.asp" -->

<%


	
If Session("Authenticated") = 0 or Session("access") <> 3 Then
	Session.Timeout=5	
	Session("TimeoutMsg")=1	
	Response.Redirect ("login.asp")	
End if

sql="SELECT offence.id, offence.firstname, offence.lastname, offence.offencename, courtorder.courtname, courtorder.courtdate, courtorder.courttime FROM offence, courtorder WHERE offence.id = courtorder.offenceid AND id = " & Request.Cookies("courteditcoid")

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
    <title>Edit Court Order</title>
    <meta name="description" content="Description" />
    <meta name="keywords" content="Keywords" />

    <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
    <!--[if IE 6]><link rel="stylesheet" href="style.ie6.css" type="text/css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" href="style.ie7.css" type="text/css" media="screen" /><![endif]-->
   
<script type="text/javascript">
	
	window.history.forward();
	function noBack()
	{
		windown.history.forward();
	}
	
	function validateForm()
	{
		var offenceid = document.forms["addcodate"]["offenceid"].value;
		if (offenceid == null || offenceid == "")
		{
			alert("You must select an Offender");
			return false;
		}
		var cotime = document.forms["addcodate"]["time"].value;
		if (cotime == null || cotime == "")
		{
			alert("You must enter a time");
			return false;
		}
		
		var oday=document.forms["addcodate"]["FirstSelectDay"].value;
		var omonth=document.forms["addcodate"]["FirstSelectMonth"].value;
		var oyear=document.forms["addcodate"]["FirstSelectYear"].value;
	
		var odate = oday+" "+ omonth+ " " + oyear;
		var dt = Date.parse(odate);
		
		var currentDate = new Date();
		var ct = Date.parse(currentDate);
	
		if (dt < ct)
		{
			alert("The offence date cannot be in the past.");
			return false;
		}
	
		var r=confirm("Are you sure you would like to edit the Court Order?");
			if (r!=true)
				return false;
	}

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
		DaysObject = eval("document.addcodate." + Which + "Day");
		MonthObject = eval("document.addcodate." + Which + "Month");
		YearObject = eval("document.addcodate." + Which + "Year");

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
		DaysObject = eval("document.addcodate." + Which + "Day");
		MonthObject = eval("document.addcodate." + Which + "Month");
		YearObject = eval("document.addcodate." + Which + "Year");

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
			line += NowYear + i;
		}
		return line;
	}

	
</script>
	</head>
		<body onLoad="SetToToday('FirstSelect');"  onload = "noBack();" onpageshow = "if (event.persisted)noBack();" onunload="">
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
            <h2 class="art-postheader">Edit Court Order</h2>
		<div class="cleared"></div>
        <div class="art-postcontent">
		
		<p>
		<b>First Name:</b> <%= rs("firstname")%> </br>
		<b>Last Name:</b> <%= rs("lastname")%> </br>
		<b>Offence:</b> <%= rs("offencename")%> </br></br>
		<b>Current Date:</b> <%= rs("courtdate")%> </br>
		<b>Current Time:</b> <%= rs("courttime")%> </br>
		</p>
		
		<FORM NAME="addcodate" METHOD=POST ACTION="courtupdateco.asp" onsubmit="return validateForm()">
		
			<div class="row">
			<span class="formw"><input type=hidden name="offenceid" value='<%= rs("id") %>'></span>
			</div>
			
			<p> Court Date: 
			<SELECT name="FirstSelectDay">
				<OPTION>1
				<OPTION>2
				<OPTION>3
				<OPTION>4
				<OPTION>5
				<OPTION>6
				<OPTION>7
				<OPTION>8
				<OPTION>9
				<OPTION>10
				<OPTION>11
				<OPTION>12
				<OPTION>13
				<OPTION>14
				<OPTION>15
				<OPTION>16
				<OPTION>17
				<OPTION>18
				<OPTION>19
				<OPTION>20
				<OPTION>21
				<OPTION>22
				<OPTION>23
				<OPTION>24
				<OPTION>25
				<OPTION>26
				<OPTION>27
				<OPTION>28
				<OPTION>29
				<OPTION>30
				<OPTION>31
			</SELECT>
			<SELECT name="FirstSelectMonth" onchange="ChangeOptionDays('FirstSelect')">
				<OPTION>Jan
				<OPTION>Feb
				<OPTION>Mar
				<OPTION>Apr
				<OPTION>May
				<OPTION>Jun
				<OPTION>Jul
				<OPTION>Aug
				<OPTION>Sep
				<OPTION>Oct
				<OPTION>Nov
				<OPTION>Dec
			</SELECT>
			<SELECT name="FirstSelectYear" onchange="ChangeOptionDays('FirstSelect')">
				<SCRIPT language="JavaScript">
					document.write(WriteYearOptions(3));
				</SCRIPT>
			</SELECT></p>
			
			<p> Time: <select name="time">
			<option value = "" >Select Time</option>
		
			<% 
				Dim t, m, h, s
				t = 830
				Do Until t = 1800
					m = t mod 100
					h = t\100
					s = CStr(h) + ":" + CStr(m)
					If h < 10 Then
						If m = 0 Then
							s = s + CStr(0)
							Response.write "<option value = '" & s & "'>0" & h & ":" & m & "0</option>"
						Else
							Response.write "<option value = '" & s & "'>0" & h & ":" & m & "</option>"
						End If	
					Else
						If m = 0 Then
							s = s + CStr(0)
							Response.write "<option value = '" & s & "'>" & h & ":" & m & "0</option>"
						Else
							Response.write "<option value = '" & s & "'>" & h & ":" & m & "</option>"
						End If	
					End If
					If m = 30 Then
						t = t + 70
					Else
						t = t + 30
					End If
				Loop
				
			%>
			</select></p>
			<div class="row">
			<span class="label"></span><span class="formw"><INPUT TYPE=SUBMIT value="Update Court Order"></span>
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

							

