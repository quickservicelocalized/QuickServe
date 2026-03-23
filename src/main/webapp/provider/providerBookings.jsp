<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<title>My Bookings</title>

<style>
body{
    font-family: 'Segoe UI', Arial;
    background:#f5f6fa;
    padding:20px;
}

/* Title */
h2{
    margin-bottom:20px;
}

/* Table */
.table{
    width:100%;
    border-collapse: collapse;
    background:white;
    border-radius:10px;
    overflow:hidden;
    box-shadow:0 4px 12px rgba(0,0,0,0.1);
}

/* Header */
.table th{
    background:#2563eb;
    color:white;
    padding:12px;
    text-align:center;
}

/* Cells */
.table td{
    padding:12px;
    text-align:center;
    border-bottom:1px solid #eee;
}

/* Status badges */
.status{
    padding:5px 10px;
    border-radius:20px;
    font-size:12px;
    font-weight:bold;
}

.pending{
    background:#fef3c7;
    color:#92400e;
}

.accepted{
    background:#d1fae5;
    color:#065f46;
}

.completed{
    background:#dbeafe;
    color:#1e40af;
}

.rejected{
    background:#fee2e2;
    color:#991b1b;
}

/* Buttons */
.btn{
    padding:6px 12px;
    border:none;
    border-radius:6px;
    cursor:pointer;
    font-size:12px;
}

.btn-accept{
    background:#16a34a;
    color:white;
}

.btn-reject{
    background:#dc2626;
    color:white;
}

.btn-complete{
    background:#2563eb;
    color:white;
}

/* Hover */
.btn:hover{
    opacity:0.9;
}
</style>

</head>

<body>

<h2>My Bookings</h2>
<div style="display:flex; gap:20px; margin-bottom:20px;">
    <div class="card">Pending: 2</div>
    <div class="card">Completed: 5</div>
</div>

<table class="table">

<tr>
    <th>Customer</th>
    <th>Service</th>
    <th>Date</th>
    <th>Status</th>
    <th>Action</th>
</tr>

<%
List<Map<String,Object>> bookings =
(List<Map<String,Object>>) request.getAttribute("bookings");

if(bookings != null){
for(Map<String,Object> b : bookings){

String status = b.get("status").toString();
%>

<tr>
    <td><%= b.get("customer") %></td>
    <td><%= b.get("service") %></td>
    <td><%= b.get("date") %></td>

    <td>
        <span class="status 
            <%= status.equals("PENDING") ? "pending" :
                status.equals("ACCEPTED") ? "accepted" :
                status.equals("COMPLETED") ? "completed" :
                "rejected" %>">

            <%= status %>
        </span>
    </td>

    <td>

    <% if(status.equals("PENDING")) { %>

        <a href="<%=request.getContextPath()%>/AcceptBookingServlet?id=<%=b.get("id")%>">
            <button class="btn btn-accept">Accept</button>
        </a>

        <a href="<%=request.getContextPath()%>/RejectBookingServlet?id=<%=b.get("id")%>">
            <button class="btn btn-reject">Reject</button>
        </a>

    <% } else if(status.equals("ACCEPTED")) { %>

        <a href="<%=request.getContextPath()%>/CompleteBookingServlet?id=<%=b.get("id")%>">
            <button class="btn btn-complete">Complete</button>
        </a>

    <% } else { %>

        -
    
    <% } %>

    </td>

</tr>

<%
}
}
%>

</table>

</body>
</html>