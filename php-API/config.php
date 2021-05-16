<?php

$username = "root";
$password = "";
$host = "localhost";
$db_name = "id16094632_prohealthdb";

$connect = mysqli_connect($host, $username, $password, $db_name);

$errorno = mysqli_error($connect);
echo "$errorno";

if (!$connect) {
    echo json_encode("Connection Failed");
}
