<%@ page import="java.sql.*" %>
<%@ page import="quickserve.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
<title>Booking History</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>

<body>

<%
    // ✅ Security check
    if(session.getAttribute("customerName") == null){
        response.sendRedirect("../index.jsp");
        return;
    }

    // Alerts
    if("true".equals(request.getParameter("success"))){
%>
<script>alert("Booking Successful!");</script>
<%
    }

    if("true".equals(request.getParameter("cancel"))){
%>
<script>alert("Booking Cancelled Successfully!");</script>
<%
    }

    if("true".equals(request.getParameter("review"))){
%>
<script>alert("Review Submitted Successfully!");</script>
<%
    }
%>

<h2 class="page-title">Your Booking History</h2>

<div class="history-container">

<%
    Connection con = DBConnection.getConnection();

    String customerName = (String) session.getAttribute("customerName");

    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM bookings WHERE customer_name = ?"
    );

    ps.setString(1, customerName);

    ResultSet rs = ps.executeQuery();

    while(rs.next()){
        String status = rs.getString("status");
%>

<div class="history-card">

    <div class="card-header">
        <h3><%= rs.getString("provider_name") %></h3>
    </div>

    <div class="card-body">
        <p><strong>Service:</strong> <%= rs.getString("service_type") %></p>
        <p><strong>Date:</strong> <%= rs.getTimestamp("booking_date") %></p>
        <p><strong>Status:</strong> <%= status %></p>

<%
    if("COMPLETED".equals(status)){

        PreparedStatement check = con.prepareStatement(
            "SELECT * FROM reviews WHERE booking_id=?"
        );

        check.setInt(1, rs.getInt("id"));

        ResultSet checkRs = check.executeQuery();

        if(checkRs.next()){
%>

        <!-- ✅ Already Reviewed -->
        <button style="background:green;color:white;padding:6px 10px;border:none;border-radius:5px;">
            ✔ Review Submitted
        </button>

<%
        } else {
%>

        <!-- ⭐ Rate Provider -->
        <a href="<%=request.getContextPath()%>/customer/review.jsp?providerId=<%=rs.getInt("provider_id")%>&bookingId=<%=rs.getInt("id")%>">
            <button style="background:#2563eb;color:white;padding:6px 10px;border:none;border-radius:5px;">
                ⭐ Rate Provider
            </button>
        </a>

<%
        }
    }
%>

    </div>

    <div class="card-footer">

<%
    if("PENDING".equals(status)){
%>

        <a href="<%=request.getContextPath()%>/CancelServlet?id=<%=rs.getInt("id")%>"
           onclick="return confirm('Are you sure you want to cancel this booking?');">

            <button class="btn-danger">Cancel</button>

        </a>

<%
    }
%>

    </div>

</div>

<%
    }
%>

</div>

</body>
</html>