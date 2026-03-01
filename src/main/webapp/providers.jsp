<%@ page import="java.util.*" %>
<link rel="stylesheet" href="style.css">

<%
List<Map<String,Object>> providers =
    (List<Map<String,Object>>) request.getAttribute("providers");

String serviceName = (String) request.getAttribute("serviceName");
%>

<div class="table-card">
<h2>Providers for <%= serviceName %></h2>

<table>
<tr>
    <th>Name</th>
    <th>Experience</th>
    <th>Rating</th>
    <th>Price</th>
    <th>Action</th>
</tr>

<%
if (providers != null && !providers.isEmpty()) {
    for(Map<String,Object> p : providers) {
%>

<tr>
    <td><%= p.get("name") %></td>
    <td><%= p.get("experience") %> yrs</td>
    <td><%= p.get("rating") %></td>
    <td>₹ <%= p.get("price") %></td>
    <td>
        <a href="<%= request.getContextPath() %>/BookServlet?providerId=<%= p.get("id") %>"
           target="contentFrame">
            <button class="btn-primary">Book</button>
        </a>
    </td>
</tr>

<%
    }
} else {
%>
<tr>
    <td colspan="5">No providers found</td>
</tr>
<%
}
%>

</table>
</div>