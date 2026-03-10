package quickserve;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ProviderRegisterServlet")
public class ProviderRegisterServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

String name = request.getParameter("name");
String email = request.getParameter("email");
String password = request.getParameter("password");
String serviceType = request.getParameter("service_type");

int experience = Integer.parseInt(request.getParameter("experience"));
double price = Double.parseDouble(request.getParameter("price"));
int discount = Integer.parseInt(request.getParameter("discount"));

try{

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"INSERT INTO providers(name,email,password,service_type,experience,price,discount) VALUES(?,?,?,?,?,?,?)"
);

ps.setString(1,name);
ps.setString(2,email);
ps.setString(3,password);
ps.setString(4,serviceType);
ps.setInt(5,experience);
ps.setDouble(6,price);
ps.setInt(7,discount);

ps.executeUpdate();

response.sendRedirect(
request.getContextPath()+"/provider/providerLogin.jsp"
);

}catch(Exception e){
e.printStackTrace();
}

}
}