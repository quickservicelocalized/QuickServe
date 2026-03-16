<!DOCTYPE html>
<html>
<head>
<title>Provider Login</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/css/style.css?v=1">

</head>

<body class="auth-page">

<div class="login-card">

<h2>Log in</h2>

<p>
Don't have an account?
<a href="providerRegister.jsp">Sign Up</a>
</p>

<form action="<%=request.getContextPath()%>/ProviderLoginServlet" method="post">

<input type="email" name="email" placeholder="Email" required>

<input type="password" name="password" placeholder="Password" required>

<button type="submit" class="login-btn">
Continue with Email
</button>

</form>

<div class="divider">
<span>or</span>
</div>

<button class="social-btn">Continue with Google</button>
<button class="social-btn">Continue with Facebook</button>
<button class="social-btn">Continue with Apple</button>

</div>

</body>
</html>