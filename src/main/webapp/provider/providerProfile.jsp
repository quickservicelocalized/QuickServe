<%@ page import="java.sql.*" %>
<%@ page import="quickserve.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<title>Provider Profile</title>

<style>
body{
    font-family: Arial;
    background:#f5f6fa;
}

.profile-header{
    background: linear-gradient(135deg,#4f46e5,#06b6d4);
    color:white;
    padding:30px;
    border-radius:12px;
    margin:20px;
}

.card{
    background:white;
    padding:20px;
    margin:20px;
    border-radius:10px;
    box-shadow:0 4px 12px rgba(0,0,0,0.1);
}

.service-card{
    background:#f9fafb;
    padding:15px;
    border-radius:8px;
    margin-bottom:15px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.btn{
    background:#2563eb;
    color:white;
    padding:6px 10px;
    border:none;
    border-radius:5px;
    cursor:pointer;
}

.available{
    color:green;
    font-weight:bold;
}

.unavailable{
    color:red;
    font-weight:bold;
}
</style>

</head>

<body>

<%
Connection con = DBConnection.getConnection();
int providerId = Integer.parseInt(session.getAttribute("providerId").toString());

PreparedStatement ps = con.prepareStatement(
"SELECT * FROM providers WHERE id=?"
);
ps.setInt(1, providerId);
ResultSet rs = ps.executeQuery();

String name="", email="", phone="";
double rating=0;

if(rs.next()){
    name = rs.getString("name");
    email = rs.getString("email");
    phone = rs.getString("phone");
    rating = rs.getDouble("rating");
}
%>

<!-- HEADER -->
<div class="profile-header">
    <h2><%= name %></h2>
    <p><strong>Email:</strong> <%= email %></p>
    <p><strong>Phone:</strong> <%= (phone==null ? "Not Provided" : phone) %></p>

    <p>
    <strong>Rating:</strong>
    <span style="color:gold;">
    <%
    int stars = (int)Math.round(rating);
    for(int i=0;i<stars;i++) out.print("&#9733;");
    for(int i=stars;i<5;i++) out.print("&#9734;");
    %>
    (<%= String.format("%.1f",rating) %>)
    </span>
    </p>
</div>

<!-- SERVICES -->
<div class="card">
<h3>My Services</h3>

<%
PreparedStatement ps2 = con.prepareStatement(
"SELECT * FROM services WHERE provider_id=?"
);
ps2.setInt(1, providerId);
ResultSet rs2 = ps2.executeQuery();

boolean hasService = false;

while(rs2.next()){
    hasService = true;

    String status = rs2.getString("availability");
    boolean isAvailable = "AVAILABLE".equalsIgnoreCase(status);
%>

<div class="service-card">

<div>
    <h4><%= rs2.getString("service_name") %></h4>
    <p>Price: ₹<%= rs2.getDouble("price") %></p>
    <p>Discount: <%= rs2.getInt("discount") %>%</p>

    <p class="<%= isAvailable ? "available" : "unavailable" %>">
        Status: <%= isAvailable ? "Available" : "Unavailable" %>
    </p>
</div>

<form action="<%=request.getContextPath()%>/ToggleAvailabilityServlet" method="post">
    <input type="hidden" name="serviceId" value="<%= rs2.getInt("id") %>">
    <button class="btn">Toggle</button>
</form>

</div>

<%
}

if(!hasService){
%>
<p>No services added yet.</p>
<%
}
%>

</div>

</body>
</html>