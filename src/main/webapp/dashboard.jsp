<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QuickServe Dashboard</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/style.css">
</head>
<body>

<div class="dashboard">

    <div class="sidebar">
        <h2 class="logo">QuickServe</h2>

        <a href="<%= request.getContextPath() %>/ServicesServlet" target="contentFrame">Services</a>
        <a href="<%= request.getContextPath() %>/booking.jsp" target="contentFrame">Booking</a>
        <a href="<%= request.getContextPath() %>/history.jsp" target="contentFrame">History</a>
    </div>

    <div class="main">

        <div class="header">
            <div>Dashboard</div>
            <div>🔔 👤</div>
        </div>

        <iframe name="contentFrame" class="content-frame"></iframe>

    </div>

</div>

</body>
</html>