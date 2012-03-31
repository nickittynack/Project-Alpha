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

class sqlite_db {
    private $path = null;
    private $db = null;

    public function __construct($path){
        $this->path = realpath($path);
        if(!$this->does_exist()){
            die("<b>Error:</b> The database does not exist.");
        }
    }

    private function does_exist(){
        if(file_exists($this->path)){
            return true;
        } else {
            return false;
        }
    }

    public function connect(){
        try{
            $this->db = new PDO("sqlite:" . $this->path);
        }
        catch(PDOException $e){
            echo $e->getMessage();
        }
    }

    public function disconnect(){
        $db = null;
    }

    public function dump_table($table){
        $db = $this->db;
        $query = $db->query("select * from " . $table);
        $result = $query->fetchall(PDO::FETCH_ASSOC);
        echo "<h1>" . $table . "</h1>";
        echo "<table>";
        foreach($result[0] as $key=>$val){
                echo "<th>" . $key . "</th>";
        }
        foreach($result as $row){
            echo "<tr>";
            foreach($row as $key=>$val){
                echo "<td>" . $val . "</td>";
            }
            echo "</tr>";
        }
        echo "</table>";
    }
}
?>