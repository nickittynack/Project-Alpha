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

if(isset($_POST["old_password"])){
  $old_password = $_POST["old_password"];
}
if(isset($_POST["new_password"])){
  $new_password = $_POST["new_password"];
}
if(isset($_POST["confirm_new_password"])){
  $confirm_new_password = $_POST["confirm_new_password"];
}
if(isset($old_password)){
  $query=$db->query("SELECT COUNT(*) FROM Employee WHERE passwd = '". md5($old_password) . "' AND EmployeeID = '". $session->get_user_id() . "'");
  

  if($query[0]["COUNT(*)"] == "0" ){
    echo "Old password was incorrect";
  }
  elseif($new_password != $confirm_new_password){
    echo "Passwords entered do not match. Please try again.";
  }else{
    echo "Password has been changed.";
    $query=$db->execute("UPDATE Employee SET passwd ='" . md5($new_password) . "' WHERE  EmployeeID = '". $session->get_user_id() . "'");
  }
  }


?>


<h1>Change Password</h1>
<form name="form1" method="post" action="">
  <table border="0">
    <tr>
      <td>Old Password</td>
      <td><label>
        <input name="old_password" id="old_password" type="password">
      </label></td>
    </tr>
    <tr>
      <td>New Password</td>
      <td><label>
        <input name="new_password" id="new_password" type="password">
      </label></td>
    </tr>
    <tr>
      <td>Confirm New Password</td>
      <td><label>
        <input name="confirm_new_password" id="confirm_new_password" type="password">
      </label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input type="submit" name="submit" id="submit" value="Change Password">
      </label></td>
    </tr>
  </table>
</form>