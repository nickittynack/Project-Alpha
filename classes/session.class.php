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

$session = new session();

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

    public function set_user_type($user){
        if($user == "ADMIN" or $user == "POLICE" or $user == "COURT"){
            $_SESSION["user_type"] = $user;
        } else {
            die("<b>Error</b> Not a valid user type.");
        }
    }

    public function get_user_type(){
        if(isset($_SESSION["user_type"])){
            return $_SESSION["user_type"];
        } else {
            $this->set_user_type("ADMIN");
            echo "No user type. Defaulting to ADMIN.";
            #die("<b>Error:</b> User type is not set.");
        }
    }

    public function set_user_id($id){
        if(strlen($id) == 6){
            $_SESSION["user_id"] = $id;
        } else {
            die("<b>Error</b> Not a valid user ID.");
        }
    }

    public function get_user_id(){
        if(isset($_SESSION["user_id"])){
            return $_SESSION["user_id"];
        } else {
            die("<b>Error:</b> User type is not set.");
        }
    }

}
?>