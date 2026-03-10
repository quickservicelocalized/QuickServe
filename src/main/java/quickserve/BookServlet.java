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

PreparedStatement ps1 = con.prepareStatement(
"SELECT name, service_type FROM providers WHERE id=?"
);

ps1.setInt(1, providerId);

ResultSet rs = ps1.executeQuery();

if(rs.next()){

String providerName = rs.getString("name");
String serviceType = rs.getString("service_type");

/* Temporary customer name */
String customerName = "Customer";

/* Insert booking */
PreparedStatement ps2 = con.prepareStatement(
"INSERT INTO bookings(provider_id, provider_name, service_type, booking_date, customer_name, status) VALUES(?,?,?,?,?,?)"
);

ps2.setInt(1, providerId);
ps2.setString(2, providerName);
ps2.setString(3, serviceType);
ps2.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
ps2.setString(5, customerName);
ps2.setString(6, "PENDING");

ps2.executeUpdate();

}

response.sendRedirect("customer/history.jsp?success=true");

}catch(Exception e){
e.printStackTrace();
}

}
}