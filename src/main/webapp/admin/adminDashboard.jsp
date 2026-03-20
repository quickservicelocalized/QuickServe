<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>

<html>
<head>
<title>Admin Dashboard</title>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
<meta charset="UTF-8">

<style>
.table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

.table th, .table td {
    padding: 10px;
    border: 1px solid #ddd;
    text-align: center;
}

.table th {
    background: #2563eb;
    color: white;
}

.delete-btn {
    color: white;
    background: red;
    padding: 5px 10px;
    border-radius: 5px;
    text-decoration: none;
}
</style>

</head>
<body>

<div style="padding:20px;">

<h2 class="page-title">Admin Dashboard</h2>

<div class="card-container">

    <div class="service-card">
        <div class="icon-circle">👨‍🔧</div>
        <h3>Total Providers</h3>
        <p><%= request.getAttribute("totalProviders") %></p>
    </div>

    <div class="service-card">
        <div class="icon-circle">📅</div>
        <h3>Total Bookings</h3>
        <p><%= request.getAttribute("totalBookings") %></p>
    </div>

    <div class="service-card">
        <div class="icon-circle">🛠️</div>
        <h3>Total Services</h3>
        <p><%= request.getAttribute("totalServices") %></p>
    </div>

</div>
</div>
<!-- Table -->

<h2>Providers</h2>

<table class="table">

<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Service</th>
    <th>Price</th>
    <th>Action</th>
</tr>

<%
List<Map<String,Object>> providers =
(List<Map<String,Object>>) request.getAttribute("providers");

for(Map<String,Object> p : providers) {
%>

<tr>
    <td><%= p.get("id") %></td>
    <td><%= p.get("name") %></td>
    <td><%= p.get("service") %></td>
    <td>₹ <%= p.get("price") %></td>
    <td>
    <a class="delete-btn"
       href="<%=request.getContextPath()%>/DeleteProviderServlet?id=<%= p.get("id") %>"
       onclick="return confirm('Delete this provider?')">
       Delete
    </a>
</td>
</tr>

<% } %>

</table>

</body>
</html>
