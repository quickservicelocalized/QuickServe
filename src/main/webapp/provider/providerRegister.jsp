<!DOCTYPE html>
<html>
<head>
<title>Provider Registration</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css?v=1">

</head>

<body class="auth-page">
<div class="login-card">

<h2>Provider Registration</h2>

<form action="<%=request.getContextPath()%>/ProviderRegisterServlet" method="post">

<input type="text" name="name" placeholder="Name">

<input type="email" name="email" placeholder="Email">

<input type="password" name="password" placeholder="Password">

<input type="text" name="service_type" placeholder="Service Type">

<input type="number" name="experience" placeholder="Experience">

<input type="number" name="price" placeholder="Price">

<input type="number" name="discount" placeholder="Discount">

<button class="login-btn">Register</button>

</form>

<p>
Already registered?
<a href="providerLogin.jsp">Login</a>
</p>

</div>

</body>
</html>