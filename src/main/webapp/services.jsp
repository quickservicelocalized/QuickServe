<%@ page import="java.sql.*" %>
<%@ page import="quickserve.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
    <title>Our Services</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<h2>Available Services</h2>

<%
    Connection con = DBConnection.getConnection();
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM services");

    while(rs.next()) {
%>

<div class="service-card">
    <h3><%= rs.getString("service_name") %></h3>
    <p><%= rs.getString("description") %></p>
    <a href="ProvidersServlet?serviceName=<%= rs.getString("service_name") %>">
        <button>View Providers</button>
    </a>
</div>

<%
    }
    con.close();
%>

</body>
</html>