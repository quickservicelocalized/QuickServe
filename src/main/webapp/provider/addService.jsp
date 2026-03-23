<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<title>Add Service</title>

<style>
body{
    font-family:'Segoe UI', Arial;
    background:#f5f6fa;
    padding:30px;
}

/* Card */
.form-card{
    background:white;
    padding:30px;
    width:400px;
    border-radius:12px;
    box-shadow:0 4px 12px rgba(0,0,0,0.1);
}

/* Title */
h2{
    margin-bottom:20px;
}

/* Labels */
label{
    font-weight:600;
    display:block;
    margin-top:10px;
}

/* Inputs */
input{
    width:100%;
    padding:10px;
    margin-top:5px;
    border:1px solid #ddd;
    border-radius:6px;
    outline:none;
}

/* Button */
.btn{
    width:100%;
    margin-top:20px;
    padding:12px;
    background:#2563eb;
    color:white;
    border:none;
    border-radius:6px;
    font-size:16px;
    cursor:pointer;
}

.btn:hover{
    background:#1e40af;
}

/* Center */
.container{
    display:flex;
    justify-content:center;
    align-items:center;
}
</style>

</head>

<body>

<div class="container">

<div class="form-card">

<h2>Add Service</h2>
<form action="<%=request.getContextPath()%>/AddServiceServlet" method="post">

<label>Service Name</label>
<input type="text" name="serviceName" required>

<label>Price</label>
<input type="number" name="price" required>

<label>Discount</label>
<input type="number" name="discount" required>

<button type="submit">Add Service</button>

</form>

</div>

</div>

</body>
</html>