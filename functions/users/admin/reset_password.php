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

if(isset($_REQUEST["employee_id"])){
  $query = $db->query("SELECT COUNT(*) FROM Employee WHERE EmployeeID = '" . $_REQUEST["employee_id"] . "'");
  if($query[0]["COUNT(*)"] != 0){
    $db->execute("UPDATE Employee SET passwd = '" . md5("123changeme") . "' WHERE EmployeeID = '" . $_REQUEST["employee_id"] . "'");
    echo "Password for Employee ID: " . $_REQUEST["employee_id"] . " has been reset to '123changeme'.";
  } else {
    echo "Employee ID doesn't exist.";
  }
}

?>

<h1>Reset User Password</h1>
<p>Resets a users password</p>
<form method="post" action="index.php?p=reset_password">
  <table border="0">
    <tr>
      <td>Employee ID</td>
      <td><label>
        <input type="text" name="employee_id" id="employee_id">
      </label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input type="submit" name="submit" id="submit" value="Reset Password">
      </label></td>
    </tr>
  </table>
</form>
