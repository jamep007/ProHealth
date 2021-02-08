<?php

include "config.php";

/*$name = mysqli_real_escape_string($connect, $_POST['name']);
$user_id = mysqli_real_escape_string($connect, $_POST['user_id']);
$username = mysqli_real_escape_string($connect, $_POST['username']);
$password = mysqli_real_escape_string($connect, $_POST['password']);
$phone = mysqli_real_escape_string($connect, $_POST['phone']);
$email = mysqli_real_escape_string($connect, $_POST['email']);*/

// Used for test purposes only
$user_id = "1234567890";
$name = "Test User";
$username = "Username";
$password = "Password";
$phone = "1112223333";
$email = "testing@test.com";


$query = "INSERT INTO users( User_ID, Name, Username, Password, Phone, Email)
                VALUES('$user_id', '$name','$username', '$password', '$phone', '$email');";

$results = mysqli_query($connect, $query);

if (!$results = 0) {
    echo "User added successfully.";
} else if ($results = 0) {
    echo "<br>The query failed.";
}
