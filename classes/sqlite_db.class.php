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

$db = new sqlite_db($config["db_file"]);

class sqlite_db {
    private $path = null;
    private $db = null;

    public function __construct($path){
        $this->path = realpath($path);
        if(!$this->does_exist()){
            die("<b>Error:</b> The database does not exist.");
        }
        $this->connect();
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

    public function query($q){
        $db = $this->db;
        $query = $db->query($q);
        $result = $query->fetchall(PDO::FETCH_ASSOC);
        return $result;
    }

    public function execute($q){
        $db = $this->db;
        $query = $db->exec($q);
    }

    public function tables(){
        $result = $this->query("SELECT name FROM sqlite_master WHERE type = 'table' AND name <> 'sqlite_sequence'");
        $array = null;
        foreach($result as $row){
            foreach($row as $field=>$val){
                $array[] = $val;
            }
        }
        return $array;
    }

    public function dump_table($table){
        $result = $this->query("SELECT * FROM " . $table);
        echo "<h1>" . $table . "</h1>";
        echo "<table>";
        foreach($result[0] as $field=>$val){
                echo "<th>" . $field . "</th>";
        }
        foreach($result as $row){
            echo "<tr>";
            foreach($row as $field=>$val){
                echo "<td>" . $val . "</td>";
            }
            echo "</tr>";
        }
        echo "</table>";
    }

    public function dump_all_tables(){
        foreach($this->tables() as $table){
            $this->dump_table($table);
        }
    }
}
?>