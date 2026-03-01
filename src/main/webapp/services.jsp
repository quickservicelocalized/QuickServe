<%@ page import="java.sql.*" %>
<%@ page import="quickserve.DBConnection" %>

<link rel="stylesheet" href="style.css">

<div class="card-container">

<%
    Connection con = DBConnection.getConnection();
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM services");

    while(rs.next()) {
%>

    <a class="service-card"
   href="<%= request.getContextPath() %>/ProvidersServlet?serviceName=<%= rs.getString("service_name") %>"
   target="contentFrame">
        <div class="icon-circle">⚙</div>
        <h3><%= rs.getString("service_name") %></h3>
        <p><%= rs.getString("description") %></p>

    </a>

<%
    }
%>

</div>