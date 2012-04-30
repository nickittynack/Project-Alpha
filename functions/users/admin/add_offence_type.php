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

if(isset($_REQUEST["offence"]) and $_REQUEST["offence"] != "" and isset($_REQUEST["fine_amount"]) and isset($_REQUEST["offence_action"])){
  $result = $db->query("SELECT COUNT(*) FROM OffenceType WHERE OffenceName = '" . $_REQUEST["offence"] . "'");
  $result = $result[0]["COUNT(*)"];
  if($result != 0){
    echo "The offence name already exists.<br/>Try editing it instead. (<a href='index.php?p=search_offence_type'>Seach Offence Type</a>)</br>";
  } else {
    if(is_numeric($_REQUEST["fine_amount"])){
      if($_REQUEST["offence_action"] == 1 or $_REQUEST["offence_action"] == 2 or $_REQUEST["offence_action"] == 3){
        $query = $db->execute("INSERT INTO OffenceType (OffenceName,FineAmount,OffenceAction) VALUES ('" . $_REQUEST["offence"] . "', '" . $_REQUEST["fine_amount"] . "', '" . $_REQUEST["offence_action"] . "')");
        echo "Offence added.";
      } else {
        echo "Offence action wasn't submitted.<br/>";
      }
    } else {
      echo "The fine amount was not a number. Do not enter a dollar sign.<br/>";
    }
  }
} elseif (isset($_REQUEST["offence"]) or isset($_REQUEST["fine_amount"]) or isset($_REQUEST["offence_action"])) {
  echo "You must submit an offence, fine amount and offence action.<br/>";
}


?>

<h1>Add Offence Type</h1>
<p>Add non-existing offences into the database.</p>
<form name="form1" method="post" action="index.php?p=add_offence_type">
  <table border="0">
    <tr>
      <td>Offence</td>
      <td><label>
        <input type="text" name="offence" id="offence">
      </label></td>
    </tr>
    <tr>
      <td>Fine Amount</td>
      <td><label>
        <input type="text" name="fine_amount" id="fine_amount">
      </label></td>
    </tr>
    <tr>
      <td>Offence Action</td>
      <td><label>
        <select name="offence_action" id="offence_action">
          <option value="1">Police</option>
          <option value="2">Court</option>
          <option value="3">Both</option>
          <option selected>Select Offence Action</option>
        </select>
      </label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input type="submit" name="submit" id="submit" value="Add">
      </label></td>
    </tr>
  </table>
</form>
