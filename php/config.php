<?php

$username = "sql3390587";
$password = "hc7p9AA9BQ";
$host = "sql3.freesqldatabase.com";
$db_name = "sql3390587";

$connect = mysqli_connect($host, $username, $password, $db_name);

$errorno = mysqli_error($connect);
echo "$errorno";

if (!$connect) {
    echo json_encode("Connection Failed");
}
