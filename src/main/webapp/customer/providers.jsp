<%@ page import="java.util.*" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

<%
List<Map<String,Object>> providers =
    (List<Map<String,Object>>) request.getAttribute("providers");
%>

<div class="card-container">

<%
if (providers != null && !providers.isEmpty()) {
    for(Map<String,Object> p : providers) {

        // ⭐ get rating safely
        Double ratingObj = (Double) p.get("avg_rating");
        double rating = (ratingObj == null) ? 0 : ratingObj;

        int fullStars = (int) Math.round(rating);
%>

<div class="service-card">

    <div class="icon-circle"></div>

    <h3><%= p.get("name") %></h3>

    <p>Experience: <%= p.get("experience") %> yrs</p>

    <!-- ⭐ RATING -->
    <p>
        Rating:
        <span style="color:gold; font-size:18px;">
        <%
            if(rating == 0){
                out.print("No Rating");
            } else {
                for(int i=0;i<fullStars;i++){ out.print("&#9733;"); }
                for(int i=fullStars;i<5;i++){ out.print("&#9733;"); }
                out.print(" (" + String.format("%.1f", rating) + ")");
            }
        %>
        </span>
    </p>

    <p>Price: ₹<%= p.get("price") %></p>
    <p>Discount: <%= p.get("discount") %>%</p>

    <div class="card-actions">
        <a href="<%= request.getContextPath() %>/customer/bookingForm.jsp?providerId=<%= p.get("id") %>">
            <button class="btn-primary">Book Now</button>
        </a>
    </div>

</div>

<%
    }
} else {
%>
<p>No providers found.</p>
<%
}
%>

</div>