package quickserve;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ServicesServlet")
public class ServicesServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Map<String,Object>> services = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM services");

            while(rs.next()) {
                Map<String,Object> service = new HashMap<>();
                service.put("name", rs.getString("service_name"));
                service.put("description", rs.getString("description"));
                services.add(service);
            }

            request.setAttribute("services", services);

            RequestDispatcher rd = request.getRequestDispatcher("services.jsp");
            rd.forward(request, response);

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
