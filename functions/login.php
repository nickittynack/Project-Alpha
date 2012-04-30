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

if(isset($_REQUEST["username"]) and isset($_REQUEST["password"]) and $_REQUEST["username"] != "" and $_REQUEST["password"] != ""){
	$db_pass = $db->query("SELECT passwd FROM Employee WHERE EmployeeID = '" . $_REQUEST["username"] . "'");
	if(isset($db_pass[0]["passwd"])){
		$db_pass = $db_pass[0]["passwd"];
		$md5_pass = md5($_REQUEST["password"]);
		if($db_pass == $md5_pass){
			$session->login();
			$user_type = $db->query("SELECT employeeType FROM Employee WHERE EmployeeID = '" . $_REQUEST["username"] . "'");
			$user_type = $user_type[0]["employeeType"];
			$session->set_user_type($user_type);
			$session->set_user_id($_REQUEST["username"]);
			header("Location: index.php");
		} else {
			echo "<p>The username or password entered was incorrect.</p>";
		}
	} else {
		echo "<p>The username or password entered was incorrect.</p>";
	}
} elseif(isset($_REQUEST["username"]) or isset($_REQUEST["password"])){
	echo "<p>You must enter a username and a password.</p>";
}
?>
	<h1>Login</h1>
	<form method="post" action="?p=login">
		<table border="0">
		    <tr>
		      <td>Employee ID</td>
		      <td><label>
		        <input type="text" name="username" id="username">
		      </label></td>
		    </tr>
		    <tr>
		      <td>Password</td>
		      <td><label>
		        <input type="password" name="password" id="password">
		      </label></td>
		    </tr>
		    <tr>
		      <td>&nbsp;</td>
		      <td><label>
		        <input type="submit" name="Login" id="Login" value="Login">
		      </label></td>
		    </tr>
		  </table>
	</form>
