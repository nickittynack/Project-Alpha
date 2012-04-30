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

if(!$session->authd()){ 
}
elseif($session->get_user_type() == "ADMIN"){
	echo '<h1>ADMIN MENU</h1><br>';
	echo '<a href="index.php?p=add_user">Add User</a><br>';
	echo '<a href="index.php?p=search_employee">Search Employee</a><br>';
	echo '<a href="index.php?p=add_offence_type">Add Offence Type</a><br>';
	echo '<a href="index.php?p=search_offence_type">Search Offence Type</a><br>';
	echo '<a href="index.php?p=reset_password">Reset User Pass</a><br>';
}
elseif($session->get_user_type() == "POLICE"){
	echo '<h1>POLICE</h1><br>';
	echo '<a href="index.php?p=add_offence">Add Offence</a><br>';
	echo '<a href="index.php?p=search_edit_offence">Search/Edit Offence</a><br>';
	echo '<a href="index.php?p=search_edit_criminal">Search/Edit Criminal</a><br>';
}
elseif($session->get_user_type() == "COURT"){
	echo '<h1>Court</h1><br>';
	echo '<a href="index.php?p=court_home">Court Home</a><br>';
	echo '<a href="index.php?p=add_verdict">Add Verdict</a><br>';
	echo '<a href="index.php?p=search_court_order">Search Court Order</a><br>';
}


?>