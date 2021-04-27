<?PHP

include "config.php";

$username = mysqli_real_escape_string($connect, $_POST['username']);
$password = mysqli_real_escape_string($connect, $_POST['password']);

$queryResult = $connect->query("SELECT * FROM UserLogin"); //change your_table with your database table that you want to fetch values

$result = array();

while ($fetchdata = $queryResult->fetch_assoc()) {
    $result[] = $fetchdata;
    echo $result;
}

//Checks array to see if the username and password checks out
if (in_array($username, $result, TRUE)) {
    if (next(array_search($username, $result, true)) == $password) {
        // Create token header as a JSON string
        $header = json_encode(['typ' => 'JWT', 'alg' => 'HS256']);

        // Create token payload as a JSON string
        $payload = json_encode(['user_id' => $user_id, 'password' => $password]);

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

        echo $jwt;
    }
}
