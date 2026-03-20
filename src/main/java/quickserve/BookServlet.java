package quickserve;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/BookServlet")
public class BookServlet extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

int providerId = Integer.parseInt(request.getParameter("providerId"));

try{

Connection con = DBConnection.getConnection();

/* ✅ GET PROVIDER DETAILS + PRICE */
PreparedStatement ps1 = con.prepareStatement(
"SELECT name, service_type, price FROM providers WHERE id=?"
);

ps1.setInt(1, providerId);

ResultSet rs = ps1.executeQuery();

if(rs.next()){

String providerName = rs.getString("name");
String serviceType = rs.getString("service_type");
double price = rs.getDouble("price");   // ✅ FIXED

HttpSession session = request.getSession();
String customerName = (String) session.getAttribute("customerName");

/* ✅ INSERT BOOKING WITH PRICE */
PreparedStatement ps2 = con.prepareStatement(
"INSERT INTO bookings(provider_id, provider_name, service_type, booking_date, customer_name, status, price) VALUES(?,?,?,?,?,?,?)"
);

ps2.setInt(1, providerId);
ps2.setString(2, providerName);
ps2.setString(3, serviceType);
ps2.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
ps2.setString(5, customerName);
ps2.setString(6, "PENDING");
ps2.setDouble(7, price);   // ✅ CORRECT

ps2.executeUpdate();

}

response.sendRedirect("customer/history.jsp?success=true");

}catch(Exception e){
e.printStackTrace();
}

}
}