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

if(isset($_REQUEST["fine_amount"]) and isset($_REQUEST["offence_action"]) and isset($_REQUEST["offence_status"])){
  if(is_numeric($_REQUEST["fine_amount"])){
    if($_REQUEST["offence_action"] == "1" or $_REQUEST["offence_action"] == "2" or $_REQUEST["offence_action"] == "3"){
      if($_REQUEST["offence_status"] == "-1" or $_REQUEST["offence_status"] == "0"){
          $db->execute("UPDATE OffenceType SET FineAmount = '" . $_REQUEST["fine_amount"] . "', OffenceAction = '" . $_REQUEST["offence_action"] . "', OffenceStatus = '" . $_REQUEST["offence_status"] . "'");
          echo "Updated Offence Type.<br />";
      } else {
        echo "Offence Status is not valid.";
      }
    } else {
      echo "Offence Action is not valid.<br/>";
    }
  } else {
    echo "Fine amount was not a number. Do not enter a dollar sign.<br/>";
  }
}

if(isset($_REQUEST["offence_name"])){
  $query = $db->query("SELECT * FROM OffenceType WHERE OffenceName = '" . $_REQUEST["offence_name"] . "'");
  $action = $query[0]["OffenceAction"];
  $status = $query[0]["OffenceStatus"];
?>

<h1>Edit Offence Type</h1>
<form name="form1" method="post" action="">
  <table border="0">
    <tr>
      <td>Offence Name</td>
      <td><?php echo $query[0]["OffenceName"];?></td>
    </tr>
    <tr>
      <td>Fine Amount</td>
      <td><label>
        <input type="text" name="fine_amount" id="fine_amount" value="<?php echo $query[0]["FineAmount"];?>">
      </label></td>
    </tr>
    <tr>
      <td>Offence Action</td>
      <td><label>
        <select name="offence_action" id="offence_action">        
          <option value="">Select Offence Action Type</option>
          <option value="1" <?php if($action == "1"){echo "selected";}?>>Fine</option>
          <option value="2" <?php if($action == "2"){echo "selected";}?>>CourtOrder </option>
          <option value="3" <?php if($action == "3"){echo "selected";}?>>Both</option>
        </select>
      </label></td>
    </tr>
    <tr>
      <td>Offence Status</td>
      <td><label>
        <select name="offence_status" id="offence_status">
          <option value="">Select Offence Status</option>
          <option value="-1" <?php if($status == "-1"){echo "selected";}?>>Active</option>
          <option value="0"  <?php if($status == "0"){echo "selected";}?>>Inactive</option>
        </select>
      </label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input type="submit" name="submit" id="submit" value="Change">
      </label></td>
    </tr>
  </table>
</form>

<?php

}


?>