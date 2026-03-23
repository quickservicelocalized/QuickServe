<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<title>Rate Provider</title>
</head>

<body>

<h2>Rate Your Service</h2>

<%
String bookingParam = request.getParameter("bookingId");
String providerParam = request.getParameter("providerId");

if(bookingParam == null || providerParam == null){
    out.println("<h3>Invalid Request</h3>");
    return;
}

int bookingId = Integer.parseInt(bookingParam);
int providerId = Integer.parseInt(providerParam);
%>

<form action="<%=request.getContextPath()%>/SubmitReviewServlet" method="post">

<input type="hidden" name="bookingId" value="<%=bookingId%>">
<input type="hidden" name="providerId" value="<%=providerId%>">

<label>Rating:</label><br>
<select name="rating" required>
    <option value="">Select</option>
    <option value="5">⭐⭐⭐⭐⭐</option>
    <option value="4">⭐⭐⭐⭐</option>
    <option value="3">⭐⭐⭐</option>
    <option value="2">⭐⭐</option>
    <option value="1">⭐</option>
</select><br><br>

<label>Comment:</label><br>
<textarea name="comment" required></textarea><br><br>

<button type="submit">Submit Review</button>

</form>

</body>
</html>