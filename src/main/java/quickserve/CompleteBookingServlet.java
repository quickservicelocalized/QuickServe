package quickserve;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/CompleteBookingServlet")
public class CompleteBookingServlet extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

int id = Integer.parseInt(request.getParameter("id"));

try{

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"UPDATE bookings SET status='COMPLETED' WHERE id=?"
);

ps.setInt(1,id);
ps.executeUpdate();

response.sendRedirect("ProviderBookingsServlet");

}catch(Exception e){
e.printStackTrace();
}

}
}