<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<title>Book Service</title>

<style>
body{
    font-family: Arial;
    background:#f5f6fa;
    padding:20px;
}

.form-box{
    background:white;
    padding:30px;
    width:400px;
    margin:auto;
    border-radius:10px;
    box-shadow:0 4px 10px rgba(0,0,0,0.1);
}

input, textarea{
    width:100%;
    padding:8px;
    margin:8px 0;
}

button{
    background:#2563eb;
    color:white;
    border:none;
    padding:10px;
    width:100%;
    border-radius:5px;
}
</style>

</head>

<body>

<%
int providerId = Integer.parseInt(request.getParameter("providerId"));
%>

<div class="form-box">

<h2>Book Service</h2>

<form action="<%=request.getContextPath()%>/BookServlet" method="post">

<input type="hidden" name="providerId" value="<%=providerId%>">

<label>Date:</label>
<input type="date" name="date" required>

<label>Time:</label>
<input type="time" name="time" required>

<label>Location:</label>
<textarea name="location" required></textarea>

<button type="submit">Confirm Booking</button>

</form>

</div>

</body>
</html>