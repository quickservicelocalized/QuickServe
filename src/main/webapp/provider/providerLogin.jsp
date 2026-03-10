<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Provider Login</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>

<body>

<div class="login-container">

<h2>Provider Login</h2>

<form action="<%=request.getContextPath()%>/ProviderLoginServlet" method="post">

<label>Email</label>
<input type="email" name="email" required>

<label>Password</label>
<input type="password" name="password" required>

<button type="submit">Login</button>
<p>
Don't have an account?
<a href="providerRegister.jsp">Register</a>
</p>
</form>

</div>

</body>
</html>