package quickserve;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AdminBookingsServlet")
public class AdminBookingsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Map<String,Object>> bookings = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM bookings");

            while(rs.next()) {
                Map<String,Object> b = new HashMap<>();
                b.put("id", rs.getInt("id"));
                b.put("provider", rs.getString("provider_name"));
                b.put("service", rs.getString("service_type"));
                b.put("customer", rs.getString("customer_name"));
                b.put("status", rs.getString("status"));
                bookings.add(b);
            }

            request.setAttribute("bookings", bookings);

            RequestDispatcher rd = request.getRequestDispatcher("admin/adminBookings.jsp");
            rd.forward(request, response);

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}