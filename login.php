<?php
session_start();

// Database connection
$servername = "localhost";
$username = "root";
$password = "";
$database = "quickserve_db";

$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$message = "";

// If form submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $email = $conn->real_escape_string($_POST['email']);
    $password = $conn->real_escape_string($_POST['password']);

    $sql = "SELECT * FROM users WHERE email='$email' AND password='$password'";
    $result = $conn->query($sql);

    if ($result && $result->num_rows > 0) {
        $_SESSION['user'] = $email;
        $message = "Login Successful!";
    } else {
        $message = "Invalid Email or Password!";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>QuickServe Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Tahoma, sans-serif;
}

body {
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background: linear-gradient(-45deg, #1e3c72, #2a5298, #0f2027, #00c6ff);
    background-size: 400% 400%;
    animation: gradientMove 10s ease infinite;
}

@keyframes gradientMove {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

.container {
    width: 380px;
    padding: 40px;
    border-radius: 20px;
    background: rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(15px);
    border: 1px solid rgba(255,255,255,0.2);
    box-shadow: 0 0 25px rgba(0, 198, 255, 0.6);
    color: white;
    text-align: center;
}

.container h1 {
    margin-bottom: 10px;
    font-size: 28px;
}

.container p {
    margin-bottom: 20px;
    font-size: 14px;
    opacity: 0.8;
}

.input-box {
    margin-bottom: 20px;
    text-align: left;
}

.input-box label {
    font-size: 13px;
}

.input-box input {
    width: 100%;
    padding: 12px;
    margin-top: 6px;
    border: none;
    border-radius: 10px;
    outline: none;
    background: rgba(255, 255, 255, 0.2);
    color: white;
}

.login-btn {
    width: 100%;
    padding: 12px;
    border: none;
    border-radius: 12px;
    background: linear-gradient(135deg, #00c6ff, #0072ff);
    color: white;
    font-size: 15px;
    cursor: pointer;
    margin-top: 10px;
}

.message {
    margin-bottom: 15px;
    font-weight: bold;
    color: yellow;
}
</style>
</head>

<body>

<div class="container">
<h1>QuickServe</h1>
<p>Localized Service Discovery & Booking</p>

<?php if($message != "") { ?>
<div class="message"><?php echo $message; ?></div>
<?php } ?>

<form method="POST" action="">
    <div class="input-box">
        <label>Email</label>
        <input type="email" name="email" required>
    </div>

    <div class="input-box">
        <label>Password</label>
        <input type="password" name="password" required>
    </div>

    <button class="login-btn" type="submit">Login</button>
    Don't have an account? <a href="signup.php">Sign Up</a>
</form>

</div>

</body>
</html>