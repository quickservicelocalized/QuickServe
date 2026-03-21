package quickserve;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ProviderLoginServlet")
public class ProviderLoginServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

String email = request.getParameter("email");
String password = request.getParameter("password");

try {

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"SELECT * FROM providers WHERE email=? AND password=?"
);

ps.setString(1,email);
ps.setString(2,password);

ResultSet rs = ps.executeQuery();

if(rs.next()){

HttpSession session = request.getSession();

session.setAttribute("providerId", rs.getInt("id"));
session.setAttribute("providerName", rs.getString("name"));

response.sendRedirect(
request.getContextPath()+"/provider/providerDashboard.jsp"
);

}
else{

response.getWriter().println("Invalid Login");

}

}catch(Exception e){
e.printStackTrace();
}

}
}