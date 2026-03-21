<!DOCTYPE html>

<html>
<head>
<title>Customer Register</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body class="auth-page">
<div class="login-card">
<h2>Customer Registration</h2>

<form action="<%= request.getContextPath() %>/CustomerRegisterServlet" method="post">

Name: <input type="text" name="name" required><br><br>
Email: <input type="email" name="email" required><br><br>
Phone: <input type="text" name="phone" required><br><br>
Password: <input type="password" name="password" required><br><br>

<button type="submit">Register</button>


</form>

<p>Already have account? 
<a href="customerLogin.jsp">Login here</a>
</p>
</div>
</body>
</html>
