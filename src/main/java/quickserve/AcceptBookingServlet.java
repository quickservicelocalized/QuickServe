package quickserve;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AcceptBookingServlet")
public class AcceptBookingServlet extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

int id = Integer.parseInt(request.getParameter("id"));

try{

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"UPDATE bookings SET status='ACCEPTED' WHERE id=?"
);

ps.setInt(1,id);
ps.executeUpdate();

response.sendRedirect("ProviderBookingsServlet");

}catch(Exception e){
e.printStackTrace();
}

}
}