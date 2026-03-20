package quickserve;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/CustomerLoginServlet")
public class CustomerLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM customers WHERE email=? AND password=?"
            );

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                // ✅ get name from DB
                String customerName = rs.getString("name"); // or "customer_name" based on your table

                HttpSession session = request.getSession();
                session.setAttribute("role", "customer");
                session.setAttribute("customerName", customerName);

                response.sendRedirect("customer/dashboard.jsp");
            }  else {
                response.getWriter().println("Invalid Login");
            }

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}