<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<title>All Providers</title>

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

.delete-btn{
    background:red;
    color:white;
    padding:5px 10px;
    text-decoration:none;
    border-radius:5px;
}
</style>

</head>

<body>

<h2>All Providers</h2>

<table class="table">

<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Service</th>
    <th>Price</th>
</tr>

<%
List<Map<String,Object>> providers =
(List<Map<String,Object>>) request.getAttribute("providers");

if(providers != null){
for(Map<String,Object> p : providers){
%>

<tr>
    <td><%=p.get("id")%></td>
    <td><%=p.get("name")%></td>
    <td><%=p.get("service")%></td>
    <td>₹ <%=p.get("price")%></td>
</tr>

<%
}
}
%>

</table>

</body>
</html>