<!DOCTYPE html>

<html>
<head>
<title>Customer Login</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body class="auth-page">
<div class="login-card">

<h2>Customer Login</h2>

<form action="<%= request.getContextPath() %>/CustomerLoginServlet" method="post">


Email: <input type="email" name="email" required><br><br>
Password: <input type="password" name="password" required><br><br>

<button type="submit">Login</button>


</form>

<p>New user? 
<a href="customerRegister.jsp">Register here</a>
</p>
</div>
</body>
</html>
