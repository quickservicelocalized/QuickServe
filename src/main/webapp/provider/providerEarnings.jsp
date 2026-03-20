<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="quickserve.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<title>Provider Earnings</title>
<meta charset="UTF-8">

<style>
body {
    font-family: Arial;
    background: #f5f6fa;
    padding: 20px;
}

.card {
    background: #fff;
    padding: 20px;
    margin-bottom: 20px;
    border-radius: 10px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

table {
    width: 100%;
    border-collapse: collapse;
    background: white;
}

table th, table td {
    padding: 10px;
    border: 1px solid #ddd;
    text-align: center;
}

table th {
    background: #2563eb;
    color: white;
}
</style>

</head>
<body>

<h2>My Earnings</h2>

<%
HttpSession session1 = request.getSession(false);

/* ✅ SESSION CHECK */
if(session1 == null || session1.getAttribute("providerId") == null){
    response.sendRedirect("../provider/providerLogin.jsp");
    return;
}

/* ✅ SAFE CAST */
int providerId = Integer.parseInt(session1.getAttribute("providerId").toString());

double total = 0;
Connection con = null;

try {

    con = DBConnection.getConnection();

    /* ✅ DB CONNECTION CHECK */
    if(con == null){
        out.println("<h3>❌ Database Connection Failed</h3>");
        return;
    }

    /* ✅ TOTAL EARNINGS */
    PreparedStatement ps = con.prepareStatement(
        "SELECT SUM(price) FROM bookings WHERE provider_id=? AND status='COMPLETED'"
    );

    ps.setInt(1, providerId);
    ResultSet rs = ps.executeQuery();

    if(rs.next()){
        total = rs.getDouble(1);
    }
%>

<!-- ✅ TOTAL CARD -->
<div class="card">
    <h3>Total Earnings</h3>
    <h1>₹ <%= total %></h1>
</div>

<!-- ✅ COMPLETED BOOKINGS -->
<h3>Completed Bookings</h3>

<table>
<tr>
    <th>Service</th>
    <th>Date</th>
    <th>Amount</th>
</tr>

<%
PreparedStatement ps2 = con.prepareStatement(
    "SELECT * FROM bookings WHERE provider_id=? AND status='COMPLETED'"
);

ps2.setInt(1, providerId);

ResultSet rs2 = ps2.executeQuery();

while(rs2.next()){
%>

<tr>
    <td><%= rs2.getString("service_type") %></td>
    <td><%= rs2.getTimestamp("booking_date") %></td>
    <td>₹ <%= rs2.getObject("price") == null ? 0 : rs2.getDouble("price") %></td>
</tr>

<%
}
%>

</table>

<%
} catch(Exception e){
    e.printStackTrace();
    out.println("<h3>❌ Error: " + e.getMessage() + "</h3>");
}
%>

</body>
</html>