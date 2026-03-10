<%@ page import="java.sql.*" %>
<%@ page import="quickserve.DBConnection" %>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
<div class="card-container">

<%
    Connection con = DBConnection.getConnection();
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM services");

    while(rs.next()) {
        String serviceName = rs.getString("service_name");
        String image = rs.getString("image");
        
%>

    <a class="service-card"
       href="<%= request.getContextPath() %>/ProvidersServlet?serviceName=<%= serviceName %>"
       target="contentFrame">

        <div class="icon-circle">
        <img src="<%= request.getContextPath() %>/images/<%= image %>"
             class="service-img"></div>
        <h3><%= serviceName %></h3>
        <p><%= rs.getString("description") %></p>

    </a>

<%
    }
%>

</div>