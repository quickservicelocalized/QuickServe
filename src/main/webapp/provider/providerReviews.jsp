<%@ page import="java.sql.*" %>
<%@ page import="quickserve.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<title>Provider Reviews</title>

<style>
body { font-family: Arial; padding:20px; background:#f5f6fa; }

.card {
    background:white;
    padding:20px;
    margin-bottom:20px;
    border-radius:10px;
    box-shadow:0 2px 8px rgba(0,0,0,0.1);
}

.review {
    border-bottom:1px solid #ddd;
    padding:10px 0;
}

.star { color: gold; }
</style>

</head>
<body>

<h2>My Reviews</h2>

<%
HttpSession session1 = request.getSession(false);

if(session1 == null || session1.getAttribute("providerId") == null){
    response.sendRedirect("providerLogin.jsp");
    return;
}

int providerId = Integer.parseInt(session1.getAttribute("providerId").toString());

Connection con = DBConnection.getConnection();

/* ⭐ AVG RATING */
PreparedStatement avgPs = con.prepareStatement(
"SELECT AVG(rating), COUNT(*) FROM reviews WHERE provider_id=?"
);

avgPs.setInt(1, providerId);
ResultSet avgRs = avgPs.executeQuery();

double avg = 0;
int total = 0;

if(avgRs.next()){
    avg = avgRs.getDouble(1);
    total = avgRs.getInt(2);
}
%>

<!-- ⭐ SUMMARY -->
<div class="card">
    <h3>Overall Rating</h3>
    <h2><%= String.format("%.1f", avg) %> / 5</h2>
    <p>Total Reviews: <%= total %></p>
</div>

<!-- 💬 ALL REVIEWS -->
<div class="card">
<h3>Customer Reviews</h3>

<%
PreparedStatement ps = con.prepareStatement(
"SELECT * FROM reviews WHERE provider_id=? ORDER BY created_at DESC"
);

ps.setInt(1, providerId);
ResultSet rs = ps.executeQuery();

while(rs.next()){
%>

<div class="review">
    <strong><%= rs.getString("customer_name") %></strong><br>

    <!-- ⭐ Stars -->
    <span class="star">
        <%
        int rating = rs.getInt("rating");
        for(int i=0;i<rating;i++){ out.print("&#9733;"); }
        for(int i=rating;i<5;i++){ out.print("&#9733;"); }
        %>
    </span>

    <p><%= rs.getString("comment") %></p>
</div>

<%
}
%>

</div>

</body>
</html>