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
if(isset($_POST["employee_id"])){
  $employee_id = $_POST["employee_id"];
  if(strlen($employee_id) > 6){
    unset($employee_id);
    echo "Employee ID can be at most 6 digits.<br/>";
  }
}
if(isset($_POST["first_name"])){
  $first_name = $_POST["first_name"];
  $query = $db->query("SELECT MAX(LENGTH(firstName)) FROM Employee");
  if(strlen($first_name) > $query[0]["MAX(LENGTH(firstName))"]){
    unset($first_name);
    echo "The first name you entered was too long.<br/>";
  }
}
if(isset($_POST["last_name"])){
  $last_name = $_POST["last_name"];
  $query = $db->query("SELECT MAX(LENGTH(lastName)) FROM Employee");
  if(strlen($last_name) > $query[0]["MAX(LENGTH(lastName))"]){
    unset($last_name);
    echo "The last name you entered was too long.<br/>";
  }
}

if(isset($employee_id) and isset($first_name) and isset($last_name)){
  $query = $db->query("SELECT EmployeeID,firstName,lastName FROM Employee WHERE EmployeeID LIKE '%" . $employee_id . "%' AND firstName LIKE '%" . $first_name . "%' AND lastName LIKE '%" . $last_name . "%'");    
  if(count($query) > 0){
    echo "<table>";
    echo "<tr>";
    foreach($query[0] as $key=>$value){
      echo "<th>" . $key . "</th>";
    }
    echo "<th>&nbsp;</th>";
    echo "</tr>";
    foreach($query as $row){
      echo "<tr>";
      foreach($row as $key=>$value){
        echo "<td>" . $value . "</td>";
      }
      echo "<td><a href='index.php?p=edit_employee&employee_id=" . $row["EmployeeID"] . "'>Edit</a></td>";
      echo "</tr>";
    }
    echo "</table>";
  } else {
    echo "No results found.";
  }
}
?>

<h1>Search Employees</h1>
<form method="post" action="?p=search_employee">
<table border="0">
    <tr>
      <td>Employee ID</td>
      <td><label>
        <input type="text" name="employee_id" id="employee_id">
      </label></td>
    </tr>
    <tr>
      <td>First Name</td>
      <td><label>
        <input type="text" name="first_name" id="first_name">
      </label></td>
    </tr>
    <tr>
      <td>Last Name</td>
      <td><label>
        <input type="text" name="last_name" id="last_name">
      </label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input type="submit" name="submit" id="submit" value="Search">
      </label></td>
    </tr>
  </table>
</form>
