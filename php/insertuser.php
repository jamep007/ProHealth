<?php

include "config.php";

$name = mysqli_real_escape_string($connect, $_POST['name']);
$user_id = mysqli_real_escape_string($connect, $_POST['user_id']);
$username = mysqli_real_escape_string($connect, $_POST['username']);
$password = mysqli_real_escape_string($connect, $_POST['password']);
$phone = mysqli_real_escape_string($connect, $_POST['phone']);
$email = mysqli_real_escape_string($connect, $_POST['email']);

// Used for test purposes only
/*$user_id = "1234567890";
$name = "Test User";
$username = "Username";
$password = "Password";
$phone = "1112223333";
$email = "testing@test.com";*/


$query = "INSERT INTO users( User_ID, Name, Username, Password, Phone, Email)
                VALUES('$user_id', '$name','$username', '$password', '$phone', '$email');";

$results = mysqli_query($connect, $query);

/*if (!$results = 0) {
    echo "User added successfully.";
} else if ($results = 0) {
    echo "<br>The query failed.";
}*/

// Create token header as a JSON string
$header = json_encode(['typ' => 'JWT', 'alg' => 'HS256']);

// Create token payload as a JSON string
$payload = json_encode(['username' => $username, 'password' => $password]);

// Encode Header to Base64Url String
$base64UrlHeader = str_replace(['+', '/', '='], ['-', '_', ''], base64_encode($header));

// Encode Payload to Base64Url String
$base64UrlPayload = str_replace(['+', '/', '='], ['-', '_', ''], base64_encode($payload));

// Create Signature Hash
$signature = hash_hmac('sha256', $base64UrlHeader . "." . $base64UrlPayload, '655E929B079FDA5421C5353DA9D41EB2CBFF502FC4D6F97F0F4CC200AB938B35', true);

// Encode Signature to Base64Url String
$base64UrlSignature = str_replace(['+', '/', '='], ['-', '_', ''], base64_encode($signature));

// Create JWT
$jwt = $base64UrlHeader . "." . $base64UrlPayload . "." . $base64UrlSignature;

echo json_encode($jwt);
