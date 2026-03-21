<!DOCTYPE html>
<html>
<head>
<title>Provider Profile</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>

<body class="auth-page">

<div class="login-card">

<h2>Edit Profile</h2>

<form action="<%=request.getContextPath()%>/UpdateProviderServlet" method="post">

<input type="text" name="name" placeholder="Name">

<input type="email" name="email" placeholder="Email">

<input type="text" name="service" placeholder="Service Type">

<input type="text" name="phone" placeholder="Phone">

<button class="login-btn">Update Profile</button>

</form>

</div>

</body>
</html>