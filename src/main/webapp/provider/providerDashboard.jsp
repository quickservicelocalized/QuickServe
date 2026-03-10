<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<title>Provider Dashboard</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>

<body>

<div class="dashboard">

<div class="sidebar">

<h2 class="logo">Provider Panel</h2>

<a href="<%=request.getContextPath()%>/ProviderBookingsServlet"
target="contentFrame">
My Bookings
</a>

<a href="#">Profile</a>

<a href="<%=request.getContextPath()%>/provider/providerLogin.jsp">
Logout
</a>

</div>

<div class="main">

<div class="header">
Provider Dashboard
</div>

<iframe 
    name="contentFrame"
    src="<%=request.getContextPath()%>/ProviderBookingsServlet"
    class="content-frame">
</iframe>

</div>

</div>

</body>
</html>