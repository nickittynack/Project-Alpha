<?php
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                                                           #
#                       Project Alpha                       #
#                                                           #
# This file is part of Project Alpha, a PHP rewrite of the  #
# NSWJLPS system. This project is designed to run on any    #
# standard implementation of PHP with SQLite.               #
#                                                           #
# Do not copy or distribute any portion of this file with   #
# permission from the original authors.                     #
#                                                           #
# Copyright 2012 Benjamin Civitico, Blair Hudson, Nicholas  #
# Reynolds & Anthony Wales                                  #
#                                                           #
# Author: Blair Hudson                                      #
# Last Modified: 4-4-2012                                  #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

class session {
    public function __construct(){
        session_start();
    }

    public function login(){
        $_SESSION["authd"] = true;
        echo "Logged in";
    }

    public function logout(){
        unset($_SESSION["authd"]);
        echo "Logged out";
    }
}
?>