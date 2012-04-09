
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
    <title>Add Offence</title>
    <meta name="description" content="Description" />
    <meta name="keywords" content="Keywords" />


    <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
    <!--[if IE 6]><link rel="stylesheet" href="style.ie6.css" type="text/css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" href="style.ie7.css" type="text/css" media="screen" /><![endif]-->
   
	<script type="text/javascript">
	
	
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
	DaysObject = eval("document.addoffender." + Which + "Day");
	MonthObject = eval("document.addoffender." + Which + "Month");
	YearObject = eval("document.addoffender." + Which + "Year");

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
	DaysObject = eval("document.addoffender." + Which + "Day");
	MonthObject = eval("document.addoffender." + Which + "Month");
	YearObject = eval("document.addoffender." + Which + "Year");

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
		
		
		
		
	function showOffenceType(str)
	{
		var xmlhttp;
		xmlhttp=new XMLHttpRequest();
		if (str=="")
		{
			document.getElementById("txtHint").innerHTML="";
			return;
		}		
		xmlhttp.onreadystatechange=function()
		{
			if (xmlhttp.readyState==4 && xmlhttp.status==200)
			{
				document.getElementById("txtHint").innerHTML=xmlhttp.responseText;
			}
		}

		xmlhttp.open("GET","getoffencetype.asp?q="+str,true);
		xmlhttp.send();
	}
	
	function showHint()
	{
	var xmlhttp;			
		xmlhttp=new XMLHttpRequest();
		pc = document.getElementById("postcode").value
		sub = document.getElementById("suburbshow").value
		if (pc=="" && sub=="")
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
		
	xmlhttp.open("GET","getpostcode.asp?q="+pc+"&s="+sub,true);
	xmlhttp.send();
	}
	
	function showOffSuburb(str)
	{
	var xmlhttp;
		xmlhttp=new XMLHttpRequest();
		if (str=="")
		{
			document.getElementById("offsubtable").innerHTML="";
			return;
		}		
		xmlhttp.onreadystatechange=function()
		{
			if (xmlhttp.readyState==4 && xmlhttp.status==200)
			{
				document.getElementById("offsubtable").innerHTML=xmlhttp.responseText;
			}
		}
		
	xmlhttp.open("GET","getsuburb.asp?q="+str,true);
	xmlhttp.send();
	}
	
	
	function loadSuburb(substate)
	{
		a = substate.split(",");
		document.getElementById("suburbshow").value= a[1];
		document.getElementById("stateshow").value= a[2];
		document.getElementById("suburb").value= a[1];
		document.getElementById("state").value= a[2];			
		document.getElementById("postcode").value= a[0];
		showHint("");
	}
	
	function loadOffSuburb(sub)
	{
		document.getElementById("offsuburb").value= sub;		
		showOffSuburb("");
	}
	
	
	
	function validateForm()
	{
	var ot=document.forms["addoffender"]["offencetype"].value;
	if (ot==null || ot=="")
		{
		alert("You must select an Offence Type");
		return false;
		}		
		
	var os=document.forms["addoffender"]["offsuburb"].value;
	if (os==null || os=="")
		{
		alert("Offence Suburb must be entered");
		return false;
		}
	
	
	
	var oday=document.forms["addoffender"]["FirstSelectDay"].value;
	var omonth=document.forms["addoffender"]["FirstSelectMonth"].value;
	var oyear=document.forms["addoffender"]["FirstSelectYear"].value;
	
	var odate = oday+" "+ omonth+ " " + oyear;
	var dt = Date.parse(odate);
		
	var currentDate = new Date();
	var ct = Date.parse(currentDate);
	
	if (dt > ct)
		{
		alert("The offence date cannot be in the future.");
		return false;
		}
			
	var com=document.forms["addoffender"]["comment"].value;
	if (com==null || com=="")
		{
		alert("Please enter a comment");
		return false;
		}		
		
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
	
	var sday=document.forms["addoffender"]["SecondSelectDay"].value;
	var smonth=document.forms["addoffender"]["SecondSelectMonth"].value;
	var syear=document.forms["addoffender"]["SecondSelectYear"].value;
	
	var sdate = sday+" "+ smonth+ " " + syear;
	var sdt = Date.parse(sdate);
	
	if (sdt > ct)
		{
		alert("The offenders date of birth cannot be in the future.");
		return false;
		}
		
	
	var lic=document.forms["addoffender"]["licenceno"].value;
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
	
	var r=confirm("Are you sure you would like to add this offence?");
		if (r!=true)
			return false;
	
	
	}
	
	window.history.forward();
    function noBack() { window.history.forward(); }
   
</SCRIPT>

</HEAD>

<BODY onload="noBack();SetToToday('FirstSelect');SetToToday('SecondSelect');" onpageshow="if (event.persisted) noBack();" onunload="">

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
								Add	Offence
                                </h2>
								<div class="cleared"></div>
                                <div class="art-postcontent">
								
								<FORM NAME="addoffender" METHOD=POST ACTION="policeaddoffenceconfirm.asp" onsubmit="return validateForm()">
								
								<h3 class="art-postheader">Offence Information</h3>
																
								<div class="row">
								<span class="label">Offence Type:</span>
								<span class="formw">
								<select name="offencetype" onchange="showOffenceType(this.value)">
								<option value = "" >Select Offence Type</option>

								
						<% 
												
						Dim rstContent
						Set rstContent = Server.CreateObject("ADODB.RecordSet")	
	
						checkSQL = "select offencename from OffenceType where offencestatus = true"
	
						rstContent.Open checkSQL, nswjlps_STRING
						
						Dim offn
	
						Do Until rstContent.EOF	
							offn = rstContent("offencename")								
							Response.write "<option value = '" &  offn & "'>" & offn & "</option>"
							rstContent.movenext
						Loop
				
						%>
						
							</select>
							</span></div>
							<div id="txtHint"></div>
																								
								<br><br>
								
								<div class="row">
								<span class="label">Offence Suburb</span><span class="formw"><input type="text" name="offsuburb" id="offsuburb" autocomplete="off" onkeyup="showOffSuburb(this.value)"/></span>
								</div>
								
								<div id="offsubtable"></div>
								
								<div class="row">
								<span class="label">Date of Offence</span>
								
								<span class="formw">								
																
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
									document.write(WriteYearOptions(100));
								</SCRIPT>
								</SELECT>
																
								</span>
								</div>
				
								
								<div class="row">
								<span class="label">Comments</span><span class="formw"><textarea cols="34" rows="3" name="comment"></textarea></span>
								</div>
								
								<div class="row">
								<h3 class="art-postheader">Offender Information</h3>
								</div>
																
								<div class="row">
								<span class="label">First Name</span><span class="formw"><input type=text name="firstname"></span>
								</div>
								
								<div class="row">
								<span class="label">Last Name</span><span class="formw"><input type=text name="lastname"></span>
								</div>
																
								<div class="row">
								<span class="label">Street Address</span><span class="formw"><input type=text name="street"></span>
								</div>
								
								<div class="row">
								<span class="label">Suburb</span><span class="formw"><input type="text" name="suburbshow" id="suburbshow" autocomplete="off" onkeyup="showHint()"></span>
								<input type="hidden" id="suburb" name="suburb" value="">
								</div>
								
								<div class="row">
								<span class="label">Postcode</span><span class="formw"><input type="text" name="postcode" id="postcode" autocomplete="off" onkeyup="showHint()"/></span>
								</div>
								
								<div id="pctable"></div>
								
								
								
								<!-- suburb and state have hidden fields since disabled textfields are not sent to the server -->
								
								<div class="row">
								<span class="label">State</span><span class="formw"><input type=text disabled="disabled" name="stateshow" id="stateshow"></span>
								<input type="hidden" id="state" name="state" value="">
								</div>
								
								<div class="row">
								<span class="label">Licence No (opt)</span><span class="formw"><input type=text name="licenceno"></span>
								</div>
								
								<div class="row">
								<span class="label">Date of Birth</span>
								
								<span class="formw">								
																
								<SELECT name="SecondSelectDay">
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

								<SELECT name="SecondSelectMonth" onchange="ChangeOptionDays('SecondSelect')">
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
								

								<SELECT name="SecondSelectYear" onchange="ChangeOptionDays('SecondSelect')">
								
								<SCRIPT language="JavaScript">
									document.write(WriteYearOptions(100));
								</SCRIPT>
								</SELECT>
																
								</span>
								</div>
								
								<div class="row">
								<span class="label">Phone</span><span class="formw"><input type=text name="phone"></span>
								</div>
								
								<div class="row">
								<span class="label">Email (opt)</span><span class="formw"><input type=text name="email"></span>
								</div>
								
								<br><br>
								
								<div class="row" style='padding-left:140px'>
								<INPUT TYPE=SUBMIT value="Add Offence">
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

							

