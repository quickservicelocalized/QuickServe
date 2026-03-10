package quickserve;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/CancelServlet")
public class CancelServlet extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

String idParam = request.getParameter("id");

if(idParam == null || idParam.isEmpty()){
response.sendRedirect(request.getContextPath()+"/customer/history.jsp");
return;
}

int bookingId = Integer.parseInt(idParam);

try {

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"DELETE FROM bookings WHERE id=?"
);

ps.setInt(1, bookingId);
ps.executeUpdate();

response.sendRedirect(request.getContextPath()+"/customer/history.jsp?cancel=true");

} catch (Exception e) {
e.printStackTrace();
}

}
}