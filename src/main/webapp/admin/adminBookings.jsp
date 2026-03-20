<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>

<html>
<head>
<title>Admin Bookings</title>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

<style>
.btn {
    padding: 6px 10px;
    border-radius: 5px;
    color: white;
    text-decoration: none;
    margin: 2px;
}

.accept { background: green; }
.reject { background: red; }
.complete { background: blue; }

.table {
    width: 100%;
    border-collapse: collapse;
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
</style>

</head>
<body>

<h2 class="page-title">Manage Bookings</h2>

<table class="table">

<tr>
    <th>ID</th>
    <th>Provider</th>
    <th>Service</th>
    <th>Customer</th>
    <th>Status</th>
    <th>Action</th>
</tr>

<%
List<Map<String,Object>> bookings =
(List<Map<String,Object>>) request.getAttribute("bookings");

for(Map<String,Object> b : bookings) {
%>

<tr>
    <td><%= b.get("id") %></td>
    <td><%= b.get("provider") %></td>
    <td><%= b.get("service") %></td>
    <td><%= b.get("customer") %></td>
    <td><%= b.get("status") %></td>
    <td>

```
    <a class="btn accept"
       href="../AcceptBookingServlet?id=<%= b.get("id") %>">Accept</a>

    <a class="btn reject"
       href="../RejectBookingServlet?id=<%= b.get("id") %>">Reject</a>

    <a class="btn complete"
       href="../CompleteBookingServlet?id=<%= b.get("id") %>">Complete</a>

</td>
```

</tr>

<% } %>

</table>

</body>
</html>
