<!DOCTYPE html>
<html>
<head>
<title>Admin Login</title>
<link rel="stylesheet"
href="<%=request.getContextPath()%>/css/style.css?v=1">
</head>
<body class="auth-page">
<div class="login-card">
<h2>Admin Login</h2>

<form action="../AdminLoginServlet" method="post">
    Username: <input type="text" name="username"><br><br>
    Password: <input type="password" name="password"><br><br>

    <button type="submit">Login</button>
</form>
</div>
</body>
</html>