<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QuickServe Dashboard</title>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

</head>
<body>

<div class="dashboard">

    <!-- Sidebar -->
    <div class="sidebar">
        <h2 class="logo">QuickServe</h2>

        <!-- Services -->
        <a href="<%= request.getContextPath() %>/ServicesServlet"
           target="contentFrame">
           Services
        </a>

        <!-- Providers -->
        <a href="<%= request.getContextPath() %>/ProvidersServlet"
           target="contentFrame">
           Providers
        </a>

        <!-- Filters -->
        <div class="filter-section">
            <h4>Filters</h4>

            <form method="get"
                  action="<%= request.getContextPath() %>/ProvidersServlet"
                  target="contentFrame">

                <!-- Rating -->
                <label>Rating</label>
                <select name="rating">
                    <option value="">All</option>
                    <option value="4">4★ & Above</option>
                    <option value="3">3★ & Above</option>
                </select>

                <!-- Price -->
                <label>Price</label>
                <select name="price">
                    <option value="">All</option>
                    <option value="0-500">0 - 500</option>
                    <option value="500-1000">500 - 1000</option>
                    <option value="1000-99999">1000+</option>
                </select>

                <!-- Discount -->
                <label>Discount</label>
                <select name="discount">
                    <option value="">All</option>
                    <option value="10">10% +</option>
                    <option value="20">20% +</option>
                    <option value="30">30% +</option>
                </select>

                <button type="submit" class="btn-primary">Apply</button>

            </form>
        </div>

        <!-- History -->
        <a href="<%= request.getContextPath() %>/customer/history.jsp"
           target="contentFrame">
           History
        </a>

    </div>


    <!-- Main Section -->
    <div class="main">

        <!-- Header -->
        <div class="header">
            <div>Dashboard</div>
            <div>🔔 👤</div>
        </div>

        <!-- Content Frame -->
<iframe 
    name="contentFrame"
    src="<%= request.getContextPath() %>/customer/customerHome.jsp"
    class="content-frame">
</iframe>

    </div>

</div>

</body>
</html>