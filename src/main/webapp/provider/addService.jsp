<%@ page contentType="text/html;charset=UTF-8" %>

<h2>Add Service</h2>

<form action="<%=request.getContextPath()%>/AddServiceServlet" method="post">

    <label>Service Name</label><br>
    <input type="text" name="service_name" required><br><br>

    <label>Description</label><br>
    <input type="text" name="description" required><br><br>

    <label>Price</label><br>
    <input type="number" name="price" required><br><br>

    <button type="submit">Add Service</button>

</form>