package quickserve;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

try {
Connection con = DBConnection.getConnection();

// ================= COUNTS =================
Statement stmt = con.createStatement();

ResultSet rs1 = stmt.executeQuery("SELECT COUNT(*) FROM providers");
rs1.next();
int totalProviders = rs1.getInt(1);

ResultSet rs2 = stmt.executeQuery("SELECT COUNT(*) FROM bookings");
rs2.next();
int totalBookings = rs2.getInt(1);

ResultSet rs3 = stmt.executeQuery("SELECT COUNT(*) FROM services");
rs3.next();
int totalServices = rs3.getInt(1);

// ================= ⭐ AVG RATING =================
double avgRating = 0;

PreparedStatement psAvg = con.prepareStatement(
"SELECT AVG(rating) FROM reviews"
);

ResultSet rsAvg = psAvg.executeQuery();

if(rsAvg.next()){
    avgRating = rsAvg.getDouble(1);
}

// ================= PROVIDERS LIST =================
ResultSet rs4 = stmt.executeQuery("SELECT * FROM providers");

List<Map<String,Object>> providers = new ArrayList<>();

while(rs4.next()) {
Map<String,Object> p = new HashMap<>();

p.put("id", rs4.getInt("id"));
p.put("name", rs4.getString("name"));
p.put("service", rs4.getString("service_type"));
p.put("price", rs4.getDouble("price"));

providers.add(p);
}

// ================= SET ATTRIBUTES =================
request.setAttribute("providers", providers);
request.setAttribute("totalProviders", totalProviders);
request.setAttribute("totalBookings", totalBookings);
request.setAttribute("totalServices", totalServices);
request.setAttribute("avgRating", avgRating);

// ================= FORWARD =================
RequestDispatcher rd =
request.getRequestDispatcher("admin/adminDashboard.jsp");

rd.forward(request, response);

} catch(Exception e) {
e.printStackTrace();
}
}
}