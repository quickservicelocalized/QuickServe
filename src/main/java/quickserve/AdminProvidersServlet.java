package quickserve;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AdminProvidersServlet")
public class AdminProvidersServlet extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

try {

Connection con = DBConnection.getConnection();

Statement stmt = con.createStatement();

ResultSet rs = stmt.executeQuery("SELECT * FROM providers");

List<Map<String,Object>> providers = new ArrayList<>();

while(rs.next()){

Map<String,Object> p = new HashMap<>();

p.put("id", rs.getInt("id"));
p.put("name", rs.getString("name"));
p.put("service", rs.getString("service_type"));
p.put("price", rs.getDouble("price"));

providers.add(p);
}

request.setAttribute("providers", providers);

RequestDispatcher rd =
request.getRequestDispatcher("admin/adminProviders.jsp");

rd.forward(request,response);

}catch(Exception e){
e.printStackTrace();
}
}
}