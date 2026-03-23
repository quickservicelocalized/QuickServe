<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
<meta charset="UTF-8">

<style>

/* Cards Layout */
.card-container{
    display:flex;
    gap:20px;
    flex-wrap:wrap;
}

/* Card */
.service-card{
    background:white;
    padding:20px;
    width:220px;
    border-radius:12px;
    text-align:center;
    box-shadow:0 4px 12px rgba(0,0,0,0.1);
    transition:0.2s;
    cursor:pointer;
}

/* Hover */
.service-card:hover{
    transform:scale(1.05);
}

/* Icon */
.icon-circle{
    width:60px;
    height:60px;
    background:#2563eb;
    color:white;
    border-radius:50%;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:24px;
    margin:0 auto 10px;
}

/* Table */
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

/* Delete button */
.delete-btn {
    color: white;
    background: red;
    padding: 6px 12px;
    border-radius: 5px;
    text-decoration: none;
}

</style>

</head>

<body>

<div style="padding:20px;">

<h2 class="page-title">Admin Dashboard</h2>

<!-- ================= CARDS ================= -->
<div class="card-container">

    <!-- 👨‍🔧 PROVIDERS -->
    <div class="service-card"
         onclick="window.location.href='<%=request.getContextPath()%>/AdminProvidersServlet'">

        <div class="icon-circle">👨‍🔧</div>
        <h3>Total Providers</h3>
        <p><%= request.getAttribute("totalProviders") %></p>
    </div>

    <!-- 📅 BOOKINGS -->
    <div class="service-card"
         onclick="window.location.href='<%=request.getContextPath()%>/AdminBookingsServlet'">

        <div class="icon-circle">📅</div>
        <h3>Total Bookings</h3>
        <p><%= request.getAttribute("totalBookings") %></p>
    </div>

    <!-- 🛠️ SERVICES -->
    <div class="service-card"
         onclick="window.location.href='<%=request.getContextPath()%>/AdminServicesServlet'">

        <div class="icon-circle">🛠️</div>
        <h3>Total Services</h3>
        <p><%= request.getAttribute("totalServices") %></p>
    </div>

    <!-- ⭐ REVIEWS -->
    <div class="service-card"
         onclick="window.location.href='<%=request.getContextPath()%>/AdminReviewsServlet'">

        <div class="icon-circle">⭐</div>
        <h3>Average Rating</h3>

        <p style="color:gold; font-size:18px;">

        <%
        Double avg = (Double) request.getAttribute("avgRating");

        if(avg == null || avg == 0){
            out.print("No Reviews");
        } else {

            int stars = (int) Math.round(avg);

            for(int i=0;i<stars;i++){ out.print("&#9733;"); }
            for(int i=stars;i<5;i++){ out.print("&#9734;"); }

            out.print(" (" + String.format("%.1f", avg) + ")");
        }
        %>

        </p>

    </div>

</div>

</div>

<!-- ================= PROVIDERS TABLE ================= -->

<div style="padding:20px;">

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

if(providers != null){
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

<%
}
}
%>

</table>

</div>

</body>
</html>