package quickserve;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AdminServicesServlet")
public class AdminServicesServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Connection con = DBConnection.getConnection();

            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM services");

            List<Map<String,Object>> services = new ArrayList<>();

            while(rs.next()){
                Map<String,Object> s = new HashMap<>();
                s.put("id", rs.getInt("id"));
                s.put("name", rs.getString("service_name"));
                s.put("description", rs.getString("description"));
                s.put("price", rs.getDouble("price"));

                services.add(s);
            }

            request.setAttribute("services", services);

            RequestDispatcher rd =
                request.getRequestDispatcher("admin/adminServices.jsp");

            rd.forward(request, response);

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}