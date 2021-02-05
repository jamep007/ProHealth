<?php

include "config.php";

$name = mysqli_real_escape_string($connect, $_POST['name']);
$user_id = mysqli_real_escape_string($connect, $_POST['user_id']);
$username = mysqli_real_escape_string($connect, $_POST['username']);
$password = mysqli_real_escape_string($connect, $_POST['password']);
$phone = mysqli_real_escape_string($connect, $_POST['phone']);
$email = mysqli_real_escape_string($connect, $_POST['email']);


// Test info to test connectivity with database
/* $name = "MODIFIED";
    $user_id = "1234567890";
    $username = "MODIFIED";
    $password = "MODIFIED";
    $phone = "0000000000";
    $email = "test@test.com"; */


$query = "UPDATE users 
                SET users.Name='$name', users.Username='$username', users.Password='$password', 
                    users.Phone='$phone', users.Email='$email'
                WHERE users.User_ID = '$user_id';";

$results = mysqli_query($connect, $query);

if (!$results = 0) {
    echo "User updated successfully.";
} else if ($results = 0) {
    echo "<br>The query failed.";
}
