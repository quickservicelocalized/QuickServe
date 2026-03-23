<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<title>All Services</title>

<style>
body{
    font-family: Arial;
    padding:20px;
}

.table{
    width:100%;
    border-collapse: collapse;
}

.table th, .table td{
    padding:10px;
    border:1px solid #ddd;
    text-align:center;
}

.table th{
    background:#2563eb;
    color:white;
}
</style>

</head>

<body>

<h2>All Services</h2>

<table class="table">

<tr>
    <th>ID</th>
    <th>Service Name</th>
    <th>Description</th>
    <th>Price</th>
</tr>

<%
List<Map<String,Object>> services =
(List<Map<String,Object>>) request.getAttribute("services");

if(services != null){
for(Map<String,Object> s : services){
%>

<tr>
    <td><%=s.get("id")%></td>
    <td><%=s.get("name")%></td>
    <td><%=s.get("description")%></td>
    <td>₹ <%=s.get("price")%></td>
</tr>

<%
}
}
%>

</table>

</body>
</html>