<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<title>Provider Home</title>

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
    cursor:pointer;
}
</style>

</head>

<body>

<%
String name = (String) session.getAttribute("providerName");
if(name == null){
    name = "Provider";
}
%>

<div class="welcome-box">
    <h1>Welcome, <%= name %> 👋</h1>
    <p>Manage your services, bookings and earnings easily.</p>
</div>

<div class="cards">

    <div class="card" >
            <h3>📅 My Bookings</h3>
        <p>View and manage bookings</p>
    </div>

    <div class="card" >
        <h3>➕ Add Service</h3>
        <p>Add new services</p>
    </div>

    <div class="card" >
        <h3>💰 Earnings</h3>
        <p>Track your income</p>
    </div>

</div>

</body>
</html>