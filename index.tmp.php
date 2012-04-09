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

require_once("config.php");
require_once($base_directory . $classes . "session.class.php");
require_once($base_directory . $classes . "sqlite.class.php");

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>NSWJLPS</title>
<link href="styles/main.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="center">
	<div id="header"></div>
  	<div id="navigation"><?php require_once $base_directory . $templates . "topnav.php" ?></div>
  	<div id="container">
   		<div id="sidenav"><?php require_once $base_directory . $templates . "sidenav.php" ?></div>
   		<div id="content"><?php require_once $base_directory . $templates . "content.php" ?></div>
    </div>
    <div id="footer">footer</div>
</div>
</body>
</html>
