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
$query = $db->query("SELECT OffenceID FROM CourtOrder");

?>
<h1>Add Verdict</h1>
<form method="post" action="?p=add_verdict">
  <table border="0">
    <tr>
      <td>Offender</td>
      <td><label>
        <select name="offence" id="offence">
         <?php
          $query = $db->query("SELECT Offence.* FROM Offence,CourtOrder WHERE Offence.ID = CourtOrder.OffenceID AND CourtOrder.CourtTime <>'' ");
              foreach($query as $a){
                  echo "<option value=" . $a["ID"] .">" . $a["FirstName"] . " " . $a["LastName"] . " - " . $a["OffenceDate"] . " - " . $a["OffenceName"] . "</option>";
          }  ?></select></label>

        </td>
    </tr>
    <tr>
      <td>Verdict</td>
      <td><label>
        <select name="verdict" id="verdict">
          <option value="GUILTY">Guilty</option>
          <option value="INNOCENT">innocent</option>
        </select>
      </label></td>
    </tr>
    <tr>
      <td>Sentence</td>
      <td><label>
        <input type="text" name="sentence" id="sentence">
      </label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input type="submit" name="submit" id="submit" value="Save">
      </label></td>
    </tr>
  </table>
</form>
