<?PHP
include "config.php";
require __DIR__ . '/../vendor/autoload.php';

use \Firebase\JWT\JWT;

$secret = "655E929B079FDA5421C5353DA9D41EB2CBFF502FC4D6F97F0F4CC200AB938B35";

//Gets sent a token
$token = mysqli_real_escape_string($connect, $_POST['token']);

//Decode the token with the secret
try {
    $decoded = JWT::decode($token, $secret, array('HS256'));
    $decoded_array = (array) $decoded;
} catch (Exception $e) {
    echo 'Caught exception: ',  $e->getMessage(), "\n";
}

//Grabs the username and password from the decoded jwt
$username = $decoded_array['username'];
$password = $decoded_array['password'];

//Queries the database to see if a user with the username and password exists
$queryResult = $connect->query("SELECT * FROM userlogin");

while ($fetchdata = $queryResult->fetch_assoc()) {
    $result[] = $fetchdata;
}

//Looks for the next item in the array
function get_next($array, $key)
{
    $currentKey = key($array);
    while ($currentKey !== null && $currentKey != $key) {
        next($array);
        $currentKey = key($array);
    }
    return next($array);
}

//Checks array to see if the username and password checks out
if (in_array($username, $result, TRUE)) {
    if (get_next($result, array_search($username, $result, true)) == $password) {
        echo json_encode("User is authenticated and authorized.");
    } else {
        die("Error: Incorrect password");
    }
} else {
    die("Error: User $username does not exist");
}


//If correct, sends an all-clear message. If not, sends error message.
