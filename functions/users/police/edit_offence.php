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

if(isset($_REQUEST["offence_id"])){
  $query = $db->query("SELECT * FROM Offence WHERE ID = '" . $_REQUEST["offence_id"] . "'");
}

?>

<h1>Edit Offence</h1>
<form method="post" action="">
  <table border="0">
    <tr>
      <td>Offence ID</td>
      <td><?php echo $query[0]["ID"]; ?></td>
    </tr>
    <tr>
      <td>Offence Name</td>
      <td><?php echo $query[0]["OffenceName"]; ?></td>
    </tr>
    <tr>
      <td>Status</td>
      <td><?php echo $query[0]["status"]; ?></td>
    </tr>
    <tr>
      <td>Offence Suburb</td>
      <td><?php echo $query[0]["OffenceSuburb"]; ?></td>
    </tr>
    <tr>
      <td>Offence Date</td>
      <td><?php echo $query[0]["OffenceDate"]; ?></td>
    </tr>
    <tr>
      <td>First Name</td>
      <td><label>
        <input type="text" name="first_name" id="first_name" value="<?php echo $query[0]["FirstName"]; ?>">
      </label></td>
    </tr>
    <tr>
      <td>Last Name</td>
      <td><label>
        <input type="text" name="last_name" id="last_name" value="<?php echo $query[0]["LastName"]; ?>">
      </label></td>
    </tr>
    <tr>
      <td>Street Address</td>
      <td><label>
        <input type="text" name="street_address" id="street_address" value="<?php echo $query[0]["OffenderAddress"]; ?>">
      </label></td>
    </tr>
    <tr>
      <td>Postcode</td>
      <td><label>
        <input type="text" name="postcode" id="postcode" value="<?php echo $query[0]["OffenderPostcode"]; ?>">
      </label></td>
    </tr>
    <tr>
      <td>Suburb</td>
      <td><label>
        <input type="text" name="suburb" id="suburb" value="<?php echo $query[0]["OffenderSuburb"]; ?>">
      </label></td>
    </tr>
    <tr>
      <td>State</td>
      <td><label>
        <select name="state" id="state">
          <option value="<?php echo $query[0]["OffenderState"]; ?>" selected><?php echo $query[0]["OffenderState"]; ?></option>
          <option value="NSW">NSW</option>
          <option value="ACT">ACT</option>
          <option value="QLD">QLD</option>
          <option value="VIC">VIC</option>
          <option value="WA">WA</option>
          <option value="NT">NT</option>
          <option value="TAS">TAS</option>
        </select>
      </label></td>
    </tr>
    <tr>
      <td>License No (opt)</td>
      <td><label>
        <input type="text" name="license_no" id="license_no" value="<?php echo $query[0]["LicenceNumber"]; ?>">
      </label></td>
    </tr>
    <tr>
      <td>Phone</td>
      <td><label>
        <input type="text" name="phone_no" id="phone_no" value="<?php echo $query[0]["OffenderPhone"]; ?>">
      </label></td>
    </tr>
    <tr>
      <td>Email(opt)</td>
      <td><label>
        <input type="text" name="email" id="email" value="<?php echo $query[0]["OffenderEmail"]; ?>">
      </label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input type="submit" name="submit" id="submit" value="Update Offence Details">
      </label></td>
    </tr>
  </table>
</form>