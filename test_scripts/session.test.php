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

# This file demonstrates how to use session.class.php to
# login and logout.

include("../classes/session.class.php"); # Include the class

$session = new session(); #Create a new session object

if($session->authd()){ #Returns a true/false if logged in
	$session->logout(); #End the session, set authd to false
	echo "You logged out, refresh the page to log in.";
} else {
	$session->login(); #Set authd to true
	echo "You are logged in, refresh the page to log out.";
}
?>