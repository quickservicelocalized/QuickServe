package quickserve;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ToggleServiceServlet")
public class ToggleServiceServlet extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

int serviceId = Integer.parseInt(request.getParameter("id"));

try{

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"UPDATE services SET availability = CASE " +
"WHEN availability='AVAILABLE' THEN 'NOT AVAILABLE' " +
"ELSE 'AVAILABLE' END WHERE id=?"
);

ps.setInt(1, serviceId);
ps.executeUpdate();

}catch(Exception e){
e.printStackTrace();
}

response.sendRedirect("provider/providerProfile.jsp");
}
}