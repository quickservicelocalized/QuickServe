package quickserve;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ProviderBookingsServlet")
public class ProviderBookingsServlet extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

HttpSession session = request.getSession(false);

if(session == null || session.getAttribute("providerId")==null){

response.sendRedirect(
request.getContextPath()+"/provider/providerLogin.jsp"
);
return;

}

int providerId = (int) session.getAttribute("providerId");

try{

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"SELECT * FROM bookings WHERE provider_id=?"
);

ps.setInt(1, providerId);

ResultSet rs = ps.executeQuery();

List<Map<String,Object>> bookings = new ArrayList<>();

while(rs.next()){

Map<String,Object> row = new HashMap<>();

row.put("id", rs.getInt("id"));
row.put("customer", rs.getString("customer_name"));
row.put("service", rs.getString("service_type"));
row.put("date", rs.getTimestamp("booking_date"));
row.put("status", rs.getString("status"));

bookings.add(row);

}

request.setAttribute("bookings", bookings);

RequestDispatcher rd =
request.getRequestDispatcher("/provider/providerBookings.jsp");

rd.forward(request,response);

}catch(Exception e){
e.printStackTrace();
}
System.out.println("Logged provider id = " + providerId);
}
}