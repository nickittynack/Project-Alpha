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
if(isset($_POST["offence_name"])){
  $offence_name = $_POST["offence_name"];
}

if(isset($offence_name)){
   $query = $db->query("SELECT OffenceName FROM OffenceType WHERE OffenceName LIKE '%" . $offence_name . "%'");    
  if(count($query) > 0){
    echo "<table>";
    echo "<tr>";
    foreach($query[0] as $key=>$value){
      echo "<th>" . $key . "</th>";
    }
    echo "<th>&nbsp;</th>";
    echo "</tr>";
    foreach($query as $row){
      echo "<tr>";
      foreach($row as $key=>$value){
        echo "<td>" . $value . "</td>";
      }
      echo "<td><a href='index.php?p=edit_offence_type&offence_name=" . $row["OffenceName"] . "'>Edit</a></td>";
      echo "</tr>";
    }
    echo "</table>";
  } else {
    echo "No results found.";
  }
}
?>

<h1>Search Offence Type</h1>
<p>Searches for an offence type in the database</p>
<form method="post" action="?p=search_offence_type">
  <table border="0">
    <tr>
      <td>Offence Name</td>
      <td><label>
        <input type="text" name="offence_name" id="offence_name">
      </label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input type="submit" name="submit" id="submit" value="Search">
      </label></td>
    </tr>
  </table>
</form>
