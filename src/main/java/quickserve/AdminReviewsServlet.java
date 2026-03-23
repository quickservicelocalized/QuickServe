package quickserve;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AdminReviewsServlet")
public class AdminReviewsServlet extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

try {

Connection con = DBConnection.getConnection();

/* JOIN WITH PROVIDERS */
PreparedStatement ps = con.prepareStatement(
"SELECT r.*, p.name AS provider_name " +
"FROM reviews r " +
"JOIN providers p ON r.provider_id = p.id " +
"ORDER BY r.created_at DESC"
);

ResultSet rs = ps.executeQuery();

List<Map<String,Object>> reviews = new ArrayList<>();

while(rs.next()){

Map<String,Object> row = new HashMap<>();

row.put("customer", rs.getString("customer_name"));
row.put("provider", rs.getString("provider_name"));
row.put("rating", rs.getInt("rating"));
row.put("comment", rs.getString("comment"));
row.put("date", rs.getTimestamp("created_at"));

reviews.add(row);
}

request.setAttribute("reviews", reviews);

RequestDispatcher rd =
request.getRequestDispatcher("admin/adminReviews.jsp");

rd.forward(request, response);

} catch(Exception e){
e.printStackTrace();
}
}
}