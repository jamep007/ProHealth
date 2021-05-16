<?php

include "config.php";

$user_id = mysqli_real_escape_string($connect, $_POST['user_id']);

$query = "DELETE FROM users
            WHERE users.User_ID ='$user_id';";

$results = mysqli_query($connect, $query);

if (!$results = 0) {
    echo json_encode("User dropped successfully.");
} else if ($results = 0) {
    echo json_encode("The query failed.");
}
