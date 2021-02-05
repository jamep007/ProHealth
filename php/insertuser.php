<?php

include "config.php";

$name = mysqli_real_escape_string($connect, $_POST['name']);
$user_id = mysqli_real_escape_string($connect, $_POST['user_id']);
$username = mysqli_real_escape_string($connect, $_POST['username']);
$password = mysqli_real_escape_string($connect, $_POST['password']);
$phone = mysqli_real_escape_string($connect, $_POST['phone']);
$email = mysqli_real_escape_string($connect, $_POST['email']);


// Test info to test connectivity with database
/*$name = "TestName";
    $user_id = "1234567890";
    $username = "TestUser";
    $password = "TestPassword";
    $phone = "1234567890";
    $email = "test@testing.com"; */


$query = "INSERT INTO users(Name, User_ID, Username, Password, Phone, Email)
                VALUES('$name', '$user_id', '$username', '$password', '$phone', '$email');";

$results = mysqli_query($connect, $query);

if (!$results = 0) {
    echo "User added successfully.";
} else if ($results = 0) {
    echo "<br>The query failed.";
}
