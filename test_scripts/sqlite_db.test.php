<?php
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                                                           #
#                       Project Alpha                       #
#                                                           #
# This file is part of Project Alpha, a PHP rewrite of the  #
# NSWJLPS system. This project is designed to run on any    #
# standard implentation of PHP with SQLite.                 #
#                                                           #
# Do not copy or distribute any portion of this file with   #
# permission from the original authors.                     #
#                                                           #
# Copyright 2012 Benjamin Civitico, Blair Hudson, Nicholas  #
# Reynolds & Anthony Wales                                  #
#                                                           #
# Author: Blair Hudson                                      #
# Last Modified: 31-3-2012                                  #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# This file demonstrates how to use sqlite_db.class.php to
# return the data within an entire table.

include("../classes/sqlite_db.class.php"); # Include the class

$path = "../nswjlps.sqlite"; # Path of the database to use
$db = new sqlite_db($path); # Create a new database object
$db->connect(); # Connect to the database
$db->dump_table("Criminal"); # Dump the table specified
$db->disconnect(); # Disconnect from the databse
?>