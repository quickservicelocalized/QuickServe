<!DOCTYPE html>
<html>
<head>
<title>Provider Registration</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>

<body>

<div class="form-container">

<h2>Provider Registration</h2>

<form action="<%=request.getContextPath()%>/ProviderRegisterServlet" method="post">

<label>Name</label>
<input type="text" name="name" required>

<label>Email</label>
<input type="email" name="email" required>

<label>Password</label>
<input type="password" name="password" required>

<label>Service Type</label>
<input type="text" name="service_type" placeholder="Plumbing / Electrician" required>

<label>Experience (years)</label>
<input type="number" name="experience" required>

<label>Price</label>
<input type="number" name="price" required>

<label>Discount (%)</label>
<input type="number" name="discount" value="0">

<button type="submit" class="btn-primary">Register</button>

</form>

<p>
Already registered?
<a href="providerLogin.jsp">Login</a>
</p>

</div>

</body>
</html>