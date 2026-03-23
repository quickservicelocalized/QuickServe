<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Provider Dashboard</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>

<body>

<div class="dashboard">

    <!-- Sidebar -->
    <div class="sidebar">
        <h2 class="logo">Provider Panel</h2>

        <a href="#" onclick="loadPage('ProviderBookingsServlet')">
            My Bookings
        </a>

        <a href="#" onclick="loadPage('provider/addService.jsp')">
            Add Service
        </a>

        <a href="#" onclick="loadPage('provider/providerProfile.jsp')">
            Profile
        </a>
        <a href="#" onclick="loadPage('provider/providerReviews.jsp')">
    Reviews
</a>

        <a href="#" onclick="loadPage('provider/providerEarnings.jsp')">
            Earnings
        </a>

        <a href="<%=request.getContextPath()%>/provider/providerLogin.jsp">
            Logout
        </a>
    </div>

    <!-- Main Content -->
    <div class="main">

        <div class="header">
            Provider Dashboard
        </div>

        <iframe 
    id="contentFrame"
    name="contentFrame"
    src="<%=request.getContextPath()%>/provider/providerHome.jsp"
    class="content-frame">
</iframe>

    </div>

</div>

<!-- JS FIX -->
<script>
function loadPage(page){
    document.getElementById("contentFrame").src =
        "<%=request.getContextPath()%>/" + page;
}
</script>

</body>
</html>