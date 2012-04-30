<?php
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                                                             #
#                       Project Alpha                         #
#                                                             #
# This file is part of Project Alpha, a PHP rewrite of the    #
# NSWJLPS system. This project is designed to run on any      #
# standard implementation of PHP with SQLite.                 #
#                                                             #
# Do not copy or distribute any portion of this file without  #
# permission from the original authors.                       #
#                                                             #
# Copyright 2012 Benjamin Civitico, Blair Hudson, Nicholas    #
# Reynolds & Anthony Wales.                                   #
#                                                             #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

if(isset($_REQUEST["employee_id"]) and isset($_REQUEST["first_name"]) and isset($_REQUEST["last_name"]) and isset($_REQUEST["day"]) and isset($_REQUEST["month"]) and isset($_REQUEST["year"]) and isset($_REQUEST["employee_type"]) and isset($_REQUEST["court_name"]) and isset($_REQUEST["email"])){
  $accept_this = true;

  if($_REQUEST["first_name"] ==  ""){
    echo "You must submit a first name.<br/>";
    $accept_this = false;
  }

  if($_REQUEST["last_name"] ==  ""){
    echo "You must submit a last name.<br/>";
    $accept_this = false;
  }

  if($_REQUEST["year"] != "" and $_REQUEST["month"] != "" and $_REQUEST["day"] != ""){
    if($_REQUEST["month"] == "4" or $_REQUEST["month"] == "6" or $_REQUEST["month"] == "9" or $_REQUEST["month"] == "11"){
      if($_REQUEST["day"] == "31"){
        echo "The month you selected only has 30 days. 31 is not a valid day.<br/>";
        $accept_this = false;
      }
    } elseif($_REQUEST["month"] == "2"){
      if($_REQUEST["day"] == "30" or $_REQUEST["day"] == "31"){
        $accept_this = false;
        echo "The month you selected only have at most 29 days. 30 and 31 are not valid days.<br/>";
      }
    }
  } else {
    echo "You must submit a date of birth.<br/>";
  }

  if($_REQUEST["email"] != ""){
    if(strpos($_REQUEST["email"],"@") == false){
      echo "Email submitted wasn't valid.<br/>";
      $accept_this = false;
    }
  } else {
    $accept_this = false;
    echo "You must submit an email.<br/>";
  }

  if($_REQUEST["employee_type"] != "COURT" and $_REQUEST["employee_type"] != "POLICE"){
    echo "You must submit an employee type.<br/>";
    $accept_this = false;
  }

  if($accept_this){
    if(isset($_REQUEST["active_service"])){
      $active = "1";
    }else{
      $active = "0";
    }
    $query = $db->execute("UPDATE Employee SET firstName = '" . $_REQUEST["first_name"] . "', lastName = '" . $_REQUEST["last_name"] . "', DOB = '" . $_REQUEST["day"] . "/" . $_REQUEST["month"] . "/" . $_REQUEST["year"] . "', employeeType = '" . $_REQUEST["employee_type"] . "', ActiveService = '" . $active . "', CourtName = '" . $_REQUEST["court_name"] . "', Email = '". $_REQUEST["email"] . "' WHERE EmployeeID = '" . $_REQUEST["employee_id"] . "'");
    echo "User was succesfully updated.<br/>";
  } else {
    echo "Employee wasn't updated, as invalid data was provided.";
  }
}

if(isset($_REQUEST["employee_id"])){
  $query = $db->query("SELECT * FROM Employee WHERE EmployeeID = '" . $_REQUEST["employee_id"] . "'");
  $dob = str_replace("0:00:00", "", $query[0]["DOB"]);
  list($day, $month, $year) = explode("/", $dob);

  ?>

<h1>Edit Employee</h1>
<form name="form1" method="post" action="">
  <table border="0">
    <tr>
      <td>Employee ID</td>
      <td><?php echo $query[0]["EmployeeID"];?></td>
    </tr>
    <tr>
      <td>First Name</td>
      <td><label>
        <input type="text" name="first_name" id="first_name" value="<?php echo $query[0]["firstName"];?>">
      </label></td>
    </tr>
    <tr>
      <td>Last Name</td>
      <td><label>
        <input type="text" name="last_name" id="last_name" value="<?php echo $query[0]["lastName"];?>">
      </label></td>
    </tr>
    <tr>
      <td>Date of Birth</td>
      <td><select name="day" id="day">
          <option value="<?php echo $day; ?>" selected><?php echo $day; ?></option>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
          <option value="6">6</option>
          <option value="7">7</option>
          <option value="8">8</option>
          <option value="9">9</option>
          <option value="10">10</option>
          <option value="11">11</option>
          <option value="12">12</option>
          <option value="13">13</option>
          <option value="14">14</option>
          <option value="15">15</option>
          <option value="16">16</option>
          <option value="17">17</option>
          <option value="18">18</option>
          <option value="19">19</option>
          <option value="20">20</option>
          <option value="21">21</option>
          <option value="22">22</option>
          <option value="23">23</option>
          <option value="24">24</option>
          <option value="25">25</option>
          <option value="26">26</option>
          <option value="27">27</option>
          <option value="28">28</option>
          <option value="29">29</option>
          <option value="30">30</option>
          <option value="31">31</option>
        </select>
        <select name="month" id="month">
          <option value="<?php echo $month; ?>" selected><?php echo $month; ?></option>
          <option value="1">Jan</option>
          <option value="2">Feb</option>
          <option value="3">Mar</option>
          <option value="4">Apr</option>
          <option value="5">May</option>
          <option value="6">Jun</option>
          <option value="7">Jul</option>
          <option value="8">Aug</option>
          <option value="9">Sep</option>
          <option value="10">Oct</option>
          <option value="11">Nov</option>
          <option value="12">Dec</option>
        </select>
        <select name="year" id="year">
          <option value="<?php echo $year; ?>" selected><?php echo $year; ?></option>
          <option value="2012">2012</option>
          <option value="2011">2011</option> 
          <option value="2010">2010</option> 
          <option value="2009">2009</option> 
          <option value="2008">2008</option> 
          <option value="2007">2007</option> 
          <option value="2006">2006</option> 
          <option value="2005">2005</option> 
          <option value="2004">2004</option> 
          <option value="2003">2003</option> 
          <option value="2002">2002</option> 
          <option value="2001">2001</option> 
          <option value="2000">2000</option> 
          <option value="1999">1999</option> 
          <option value="1998">1998</option> 
          <option value="1997">1997</option> 
          <option value="1996">1996</option> 
          <option value="1995">1995</option> 
          <option value="1994">1994</option> 
          <option value="1993">1993</option> 
          <option value="1992">1992</option> 
          <option value="1991">1991</option> 
          <option value="1990">1990</option> 
          <option value="1989">1989</option> 
          <option value="1988">1988</option> 
          <option value="1987">1987</option> 
          <option value="1986">1986</option> 
          <option value="1985">1985</option> 
          <option value="1984">1984</option> 
          <option value="1983">1983</option> 
          <option value="1982">1982</option> 
          <option value="1981">1981</option> 
          <option value="1980">1980</option> 
          <option value="1979">1979</option> 
          <option value="1978">1978</option> 
          <option value="1977">1977</option> 
          <option value="1976">1976</option> 
          <option value="1975">1975</option> 
          <option value="1974">1974</option> 
          <option value="1973">1973</option> 
          <option value="1972">1972</option> 
          <option value="1971">1971</option> 
          <option value="1970">1970</option> 
          <option value="1969">1969</option> 
          <option value="1968">1968</option> 
          <option value="1967">1967</option> 
          <option value="1966">1966</option> 
          <option value="1965">1965</option> 
          <option value="1964">1964</option> 
          <option value="1963">1963</option> 
          <option value="1962">1962</option> 
          <option value="1961">1961</option> 
          <option value="1960">1960</option> 
          <option value="1959">1959</option> 
          <option value="1958">1958</option> 
          <option value="1957">1957</option> 
          <option value="1956">1956</option> 
          <option value="1955">1955</option> 
          <option value="1954">1954</option> 
          <option value="1953">1953</option> 
          <option value="1952">1952</option> 
          <option value="1951">1951</option> 
          <option value="1950">1950</option> 
          <option value="1949">1949</option> 
          <option value="1948">1948</option> 
          <option value="1947">1947</option> 
          <option value="1946">1946</option> 
          <option value="1945">1945</option> 
          <option value="1944">1944</option> 
          <option value="1943">1943</option> 
          <option value="1942">1942</option> 
          <option value="1941">1941</option> 
          <option value="1940">1940</option> 
          <option value="1939">1939</option> 
          <option value="1938">1938</option> 
          <option value="1937">1937</option> 
          <option value="1936">1936</option> 
          <option value="1935">1935</option> 
          <option value="1934">1934</option> 
          <option value="1933">1933</option> 
          <option value="1932">1932</option> 
          <option value="1931">1931</option> 
          <option value="1930">1930</option> 
          <option value="1929">1929</option> 
          <option value="1928">1928</option> 
          <option value="1927">1927</option> 
          <option value="1926">1926</option> 
          <option value="1925">1925</option> 
          <option value="1924">1924</option> 
          <option value="1923">1923</option> 
          <option value="1922">1922</option> 
          <option value="1921">1921</option> 
          <option value="1920">1920</option> 
          <option value="1919">1919</option> 
          <option value="1918">1918</option> 
          <option value="1917">1917</option> 
          <option value="1916">1916</option> 
          <option value="1915">1915</option> 
          <option value="1914">1914</option> 
          <option value="1913">1913</option> 
          <option value="1912">1912</option> 
          <option value="1911">1911</option> 
          <option value="1910">1910</option>
        </select>

      </td>
    </tr>
    <tr>
      <td>Employee Type</td>
      <td><label>
        <select name="employee_type" id="employee_type">
          <option>Employee Type</option>
          <option value="POLICE" <?php if($query[0]["employeeType"] == "POLICE"){ echo "selected";} ?>>Police</option>
          <option value="COURT" <?php if($query[0]["employeeType"] == "COURT"){ echo "selected";} ?>>Court</option>
          <option value="ADMIN" <?php if($query[0]["employeeType"] == "ADMIN"){ echo "selected";} ?>>Admin</option>
        </select>
      </label></td>
    </tr>
    <tr>
      <td>Active Service</td>
      <td><label>
        <input type="checkbox" name="active_service" id="active_service" value="1" <?php if($query[0]["ActiveService"] == "1"){echo "checked";} else { echo "unchecked";}?>
      </label></td>
    </tr>
    <tr>
      <td>Court Name</td>
      <td><label>
        <input type="text" name="court_name" id="court_name" value="<?php echo $query[0]["CourtName"] ?>">
      </label></td>
    </tr>
    <tr>
      <td>Email</td>
      <td><label>
        <input type="text" name="email" id="email"value="<?php echo $query[0]["Email"] ?>">
      </label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input type="submit" name="submit" id="submit" value="Change">
      </label></td>
    </tr>
  </table>
  <p>&nbsp;</p>
</form>

  <?php
} else {
  echo "No Employee ID was selected.";
}
?>