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

class session {
    public function __construct(){
        session_start();
    }

    public function login(){
        $_SESSION["authd"] = true;
    }

    public function logout(){
        session_unset();
        session_destroy();
    }

    public function authd(){
        if(isset($_SESSION["authd"])){
            return true;
        } else {
            return false;
        }
    }
}
?>