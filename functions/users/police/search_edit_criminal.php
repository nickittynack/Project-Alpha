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
?>

<h1>Search Criminal</h1>
<h2>Search Parameters</h2>
<form name="form1" method="post" action="">
  <table border="0">
    <tr>
      <td>License No</td>
      <td><label>
        <input type="text" name="license_no" id="license_no">
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
      <td>Suburb</td>
      <td><label>
        <input type="text" name="suburb" id="suburb">
      </label></td>
    </tr>
    <tr>
      <td>State</td>
      <td><label>
        <select name="state" id="state">
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
      <td>&nbsp;</td>
      <td><label>
        <input type="submit" name="submit" id="submit" value="Search">
      </label></td>
    </tr>
  </table>
</form>
