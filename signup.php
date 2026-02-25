<?php
$conn = new mysqli("localhost", "root", "", "quickserve_db");

$message = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $email = $_POST['email'];
    $password = $_POST['password'];

    $check = $conn->query("SELECT * FROM users WHERE email='$email'");

    if ($check->num_rows > 0) {
        $message = "Email already registered!";
    } else {
        $conn->query("INSERT INTO users (email, password) VALUES ('$email', '$password')");
        $message = "Registration Successful! <a href='login.php'>Login Now</a>";
    }
}
?>

<h2>Sign Up</h2>

<?php if($message != "") echo "<p>$message</p>"; ?>

<form method="POST">
    Email:<br>
    <input type="email" name="email" required><br><br>

    Password:<br>
    <input type="password" name="password" required><br><br>

    <button type="submit">Register</button>
</form>

<br>
<a href="login.php">Back to Login</a>