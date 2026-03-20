<!DOCTYPE html>

<html>
<head>
<title>QuickServe</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<meta charset="UTF-8">
<style>

/* Header */
.header {
    background:#1f2937;
    color:white;
    padding:15px 30px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.header h2{
margin:0;
}

/* Login buttons */
.login-buttons a{
background:#2563eb;
color:white;
padding:8px 14px;
border-radius:6px;
text-decoration:none;
margin-left:10px;
}

.login-buttons a:hover{
background:#1e40af;
}

/* Landing section */
.landing{
text-align:center;
padding:80px 20px;
}

.landing h1{
font-size:40px;
margin-bottom:20px;
}

.landing p{
font-size:18px;
color:#555;
}

/* Service cards */
.service-section{
display:flex;
justify-content:center;
gap:30px;
padding:40px;
}

.service-box{
background:white;
padding:25px;
width:200px;
border-radius:10px;
box-shadow:0 5px 15px rgba(0,0,0,0.1);
text-align:center;
}

/* Review section */
.review{
background:#f3f4f6;
padding:40px;
text-align:center;
}

/* Footer */
.footer{
background:#1f2937;
color:white;
text-align:center;
padding:15px;
margin-top:40px;
}

</style>

</head>

<body>

<!-- Header -->
<div class="header">

<h2>QuickServe</h2>

<div class="login-buttons">

<a href="customer/customerLogin.jsp">Customer Login</a>
<a href="provider/providerLogin.jsp">Provider Login</a>
<a href="admin/adminLogin.jsp">Admin Login</a>
</div>

</div>


<!-- Landing Page -->

<div class="landing">

<h1>Welcome to QuickServe</h1>

<p>
Book trusted professionals for home services easily.
</p>

</div>


<!-- Services -->

<div class="service-section">

<div class="service-box">
<h3>Plumbing</h3>
<p>All plumbing services</p>
</div>

<div class="service-box">
<h3>Electrician</h3>
<p>Electrical repair & installation</p>
</div>

<div class="service-box">
<h3>Cleaning</h3>
<p>Home and office cleaning</p>
</div>

</div>


<!-- Reviews -->

<div class="review">

<h2>Customer Reviews</h2>

<p>⭐ ⭐ ⭐ ⭐ ⭐ 4.8 Average Rating</p>

<p>Trusted by hundreds of customers.</p>

</div>


<!-- Footer -->

<div class="footer">

<p>© 2026 QuickServe | Home Service Marketplace</p>

</div>

</body>
</html>