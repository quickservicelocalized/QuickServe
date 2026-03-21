<%@ page import="java.util.*" %>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">

<h2>My Bookings</h2>

<table border="1">

<tr>
<th>Customer</th>
<th>Service</th>
<th>Date</th>
<th>Status</th>
<th>Action</th>
</tr>

<%
List<Map<String,Object>> bookings =
(List<Map<String,Object>>) request.getAttribute("bookings");

for(Map<String,Object> b : bookings){

String status = (String)b.get("status");
%>

<tr>

<td><%= b.get("customer") %></td>
<td><%= b.get("service") %></td>
<td><%= b.get("date") %></td>
<td><%= status %></td>

<td>

<%
if("PENDING".equals(status)){
%>

<a href="<%=request.getContextPath()%>/AcceptBookingServlet?id=<%=b.get("id")%>">
<button>Accept</button>
</a>

<a href="<%=request.getContextPath()%>/RejectBookingServlet?id=<%=b.get("id")%>">
<button>Reject</button>
</a>

<%
}
else if(status.equals("ACCEPTED")){
%>

<a href="<%=request.getContextPath()%>/CompleteBookingServlet?id=<%=b.get("id")%>">
<button>Complete</button>
</a>

<%
}
%>

</td>

</tr>

<%
}
%>

</table>