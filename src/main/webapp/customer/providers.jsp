<%@ page import="java.util.*" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

<%
List<Map<String,Object>> providers =
    (List<Map<String,Object>>) request.getAttribute("providers");
%>

<div class="card-container">

<%
if (providers != null && !providers.isEmpty()) {
    for(Map<String,Object> p : providers) {
%>

<div class="service-card">

    <div class="icon-circle"></div>

    <h3><%= p.get("name") %></h3>

    <p>Experience:<%= p.get("experience") %> yrs</p>
    <p>Rating:<%= p.get("rating") %></p>
    <p>Price: ₹<%= p.get("price") %></p>
<p>Discount: <%= p.get("discount") %>%</p>

    <div class="card-actions">
        <a href="<%= request.getContextPath() %>/BookServlet?providerId=<%= p.get("id") %>"
           target="contentFrame">
            <button class="btn-primary">Book Now</button>
        </a>
    </div>

</div>

<%
    }
} else {
%>
<p>No providers found.</p>
<%
}
%>

</div>