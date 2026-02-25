<%@ page import="java.sql.*" %>
<%
    if("true".equals(request.getParameter("cancel"))) {
%>
<script>
    alert("Booking Cancelled Successfully!");
</script>
<%
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Booking History</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<%
    if("true".equals(request.getParameter("success"))) {
%>
<script>
    alert("Booking Successful!");
</script>
<%
    }
%>

<h2>Your Booking History</h2>

<%
    Connection con = quickserve.DBConnection.getConnection();
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM bookings ORDER BY booking_date DESC");

    while(rs.next()) {
%>

<div class="service-card">
    <h3><%= rs.getString("provider_name") %></h3>
    <p>Service: <%= rs.getString("service_type") %></p>
    <p>Date: <%= rs.getTimestamp("booking_date") %></p>
    <a href="CancelServlet?bookingId=<%= rs.getInt("id") %>"
   onclick="return confirm('Are you sure you want to cancel this booking?');">
    <button style="background-color:red;">Cancel</button>
</a>
</div>

<%
    }
%>

</body>
</html>