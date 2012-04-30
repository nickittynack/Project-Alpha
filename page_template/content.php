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

if (isset($_GET['p']) or $session->authd()){

	if(isset($_GET['p'])){
		$p = $_GET['p'];

		if ($p == "login") {
			require($config['functions'] .'login.php');
		}
		if ($p == "logout") {
			$session->logout();
			require($config['functions'] .'login.php');
			header("Location: index.php");
		}
		if ($p == "change_password") {
			require($config['functions'] .'change_password.php');
		}
		//Admin Functions
		if ($p == "add_user"){
			require($config['functions'] . 'users/admin/add_user.php');
		}
		if ($p == "search_employee"){
			require($config['functions'] . 'users/admin/search_employees.php');
		}
		if ($p == "add_offence_type"){
			require($config['functions'] . 'users/admin/add_offence_type.php');
		}
		if ($p == "search_offence_type"){
			require($config['functions'] . 'users/admin/search_offence.php');
		}
		if ($p == "edit_offence_type"){
			require($config['functions'] . 'users/admin/edit_offence_type.php');
		}
		if ($p == "reset_password"){
			require($config['functions'] . 'users/admin/reset_password.php');
		}
		if ($p == "edit_employee"){
			require($config['functions'] . 'users/admin/edit_employee.php');
		}
		//Police Functions
		if ($p == "add_offence"){
			require($config['functions'] . 'users/police/add_offence.php');
		}
		if ($p == "search_edit_offence"){
			require($config['functions'] . 'users/police/search_edit_offence.php');
		}
		if ($p == "edit_offence"){
			require($config['functions'] . 'users/police/edit_offence.php');
		}
		if ($p == "search_edit_criminal"){
			require($config['functions'] . 'users/police/search_edit_criminal.php');
		}
		//court Functions
		if ($p == "court_home"){
			require($config['functions'] . 'users/court/court_home.php');
		}
		if ($p == "add_verdict"){
			require($config['functions'] . 'users/court/add_verdict.php');
		}
		if ($p == "search_court_order"){
			require($config['functions'] . 'users/court/search_court_order.php');
		}
		if ($p == "edit_court_order"){
			require($config['functions'] . 'users/court/edit_court_order.php');
		}
	}  else {
		require($config['functions'] . 'users/admin/add_user.php');
	}
} else {
	require($config['functions'] .'login.php');
}

?>