<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<title>Customer Home</title>

<style>
body{
    font-family: Arial;
    padding:30px;
    background:#f5f6fa;
}

.welcome-box{
    background:white;
    padding:30px;
    border-radius:12px;
    box-shadow:0 4px 10px rgba(0,0,0,0.1);
    text-align:center;
}

.cards{
    display:flex;
    gap:20px;
    margin-top:30px;
}

.card{
    flex:1;
    background:white;
    padding:20px;
    border-radius:10px;
    text-align:center;
    box-shadow:0 4px 10px rgba(0,0,0,0.1);
}
</style>

</head>

<body>

<%
String name = (String) session.getAttribute("customerName");
if(name == null){
    name = "Customer";
}
%>

<div class="welcome-box">
    <h1>Welcome, <%= name %> 👋</h1>
    <p>Book trusted professionals easily with QuickServe.</p>
</div>

<div class="cards">

    <div class="card">
        <h3>🔧 Services</h3>
        <p>Explore available services</p>
    </div>

    <div class="card">
        <h3>👨‍🔧 Providers</h3>
        <p>Find skilled professionals</p>
    </div>

    <div class="card">
        <h3>📜 History</h3>
        <p>Track your bookings</p>
    </div>

</div>

</body>
</html>