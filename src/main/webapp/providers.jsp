<%@ page import="java.util.*" %>
<link rel="stylesheet" href="style.css">
<%
    List<Map<String, Object>> providers =
        (List<Map<String, Object>>) request.getAttribute("providers");

    if (providers != null && !providers.isEmpty()) {
        for (Map<String, Object> p : providers) {
%>

<div class="service-card">
    <h3><%= p.get("name") %></h3>
    <p>Experience: <%= p.get("experience") %> years</p>
    <p>Rating: <%= p.get("rating") %></p>
    <p>Price: <%= p.get("price") %></p>
    <a href="BookServlet?providerId=<%= p.get("id") %>">
    <button>Book Now</button>
</a>
</div>

<%
        }
    } else {
%>
    <p>No providers found.</p>
<%
    }
%>