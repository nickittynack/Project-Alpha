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
if(isset($_REQUEST["offence_id"]) and isset($_REQUEST["offence_type"]) and isset($_REQUEST["offence_suburb"]) and isset($_REQUEST["last_name"]) and isset($_REQUEST["first_name"])){
  $query = $db->query("SELECT ID, OffenceName, FirstName, LastName, OffenceSuburb FROM Offence WHERE ID LIKE '%" . $_REQUEST["offence_id"] . "%' AND firstName LIKE '%" . $_REQUEST["first_name"] . "%' AND OffenceName LIKE '%" . $_REQUEST["offence_type"] . "%' AND LastName LIKE '%" . $_REQUEST["last_name"] . "%' AND OffenceSuburb LIKE '%" . $_REQUEST["offence_suburb"] . "%'");
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
      echo "<td><a href='index.php?p=edit_offence&offence_id=" . $row["ID"] . "'>Edit</a></td>";
      echo "</tr>";
    }
    echo "</table>";
  } else {
    echo "No results found.";
  }
}

$offence_types = $db->query("SELECT OffenceName FROM OffenceType");
$list = "";
foreach($offence_types as $row){
    $list .= "<option value='" . $row["OffenceName"] . "'>" . $row["OffenceName"] . "</option>";
}

?>


<h1>Search and Edit Offences</h1>
<h2>Search Parameters</h2>
<form method="post" action="">
  <table border="0">
    <tr>
      <td>Offence ID</td>
      <td><label>
        <input type="text" name="offence_id" id="offence_id">
      </label></td>
    </tr>
    <tr>
      <td>Offence Type</td>
      <td>
        <select name="offence_type" id="offence_type">        
            <option value="">Select Offence Action Type</option>
            <?php echo $list; ?>
        </select>
      </td>
    </tr>
    <tr>
      <td>Offence Suburb</td>
      <td><label>
        <input type="text" name="offence_suburb" id="offence_suburb">
      </label></td>
    </tr>
    <tr>
      <td>First Name</td>
      <td><label>
        <input type="text" name="first_name" id="first_name">
      </label></td>
    </tr>
    <tr>
      <td>Last Name</td>
      <td><label>
        <input type="text" name="last_name" id="last_name">
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
