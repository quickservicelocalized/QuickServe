<!DOCTYPE html>
<html>
<head>
    <title>QuickServe Dashboard</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="dashboard">

    <!-- Sidebar -->
    <div class="sidebar">
        <h2>QuickServe</h2>
        <a href="services.jsp">Services</a>
        <a href="history.jsp">Bookings</a>
    </div>

    <!-- Main -->
    <div class="main">

        <div class="header">
            <h3>Dashboard</h3>
            <div>Welcome Admin</div>
        </div>

        <div class="content">
            <jsp:include page="services.jsp" />
        </div>

    </div>

</div>

</body>
</html>