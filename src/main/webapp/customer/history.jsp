<%@ page import="java.sql.*" %>
<%@ page import="quickserve.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
<title>Booking History</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>

<body>

<%
if("true".equals(request.getParameter("success"))){
%>
<script>
alert("Booking Successful!");
</script>
<%
}

if("true".equals(request.getParameter("cancel"))){
%>
<script>
alert("Booking Cancelled Successfully!");
</script>
<%
}
%>

<h2 class="page-title">Your Booking History</h2>

<div class="history-container">

<%
Connection con = DBConnection.getConnection();
Statement stmt = con.createStatement();

ResultSet rs = stmt.executeQuery(
"SELECT * FROM bookings ORDER BY booking_date DESC"
);

while(rs.next()){

String status = rs.getString("status");
%>

<div class="history-card">

<div class="card-header">
<h3><%= rs.getString("provider_name") %></h3>
</div>

<div class="card-body">
<p><strong>Service:</strong> <%= rs.getString("service_type") %></p>
<p><strong>Date:</strong> <%= rs.getTimestamp("booking_date") %></p>
<p><strong>Status:</strong> <%= status %></p>
</div>

<div class="card-footer">

<%
if("PENDING".equals(status)){
%>

<a href="<%=request.getContextPath()%>/CancelServlet?id=<%=rs.getInt("id")%>"
onclick="return confirm('Are you sure you want to cancel this booking?');">

<button class="btn-danger">Cancel</button>

</a>

<%
}
%>

</div>

</div>

<%
}
%>

</div>

</body>
</html>