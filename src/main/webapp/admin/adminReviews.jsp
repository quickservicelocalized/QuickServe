<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<title>All Reviews</title>

<style>
body { font-family: Arial; padding:20px; }

.table {
    width:100%;
    border-collapse: collapse;
}

.table th, .table td {
    padding:10px;
    border:1px solid #ddd;
    text-align:center;
}

.table th {
    background:#2563eb;
    color:white;
}

.star { color:gold; }
</style>

</head>
<body>

<h2>All Customer Reviews</h2>

<table class="table">

<tr>
<th>Customer</th>
<th>Provider</th>
<th>Rating</th>
<th>Comment</th>
<th>Date</th>
</tr>

<%
List<Map<String,Object>> reviews =
(List<Map<String,Object>>) request.getAttribute("reviews");

for(Map<String,Object> r : reviews){
%>

<tr>
<td><%= r.get("customer") %></td>
<td><%= r.get("provider") %></td>

<td class="star">
<%
int rating = (int) r.get("rating");

for(int i=0;i<rating;i++){ out.print("&#9733;"); }
for(int i=rating;i<5;i++){ out.print("&#9734;"); }
%>
</td>

<td><%= r.get("comment") %></td>
<td><%= r.get("date") %></td>
</tr>

<%
}
%>

</table>

</body>
</html>