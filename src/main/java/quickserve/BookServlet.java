package quickserve;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/BookServlet")
public class BookServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int providerId = Integer.parseInt(request.getParameter("providerId"));

        try {
            Connection con = DBConnection.getConnection();

            // Get provider details
            PreparedStatement ps1 = con.prepareStatement(
                "SELECT name, service_type FROM providers WHERE id=?"
            );
            ps1.setInt(1, providerId);
            ResultSet rs = ps1.executeQuery();

            if (rs.next()) {

                PreparedStatement ps2 = con.prepareStatement(
                    "INSERT INTO bookings (provider_id, provider_name, service_type) VALUES (?, ?, ?)"
                );

                ps2.setInt(1, providerId);
                ps2.setString(2, rs.getString("name"));
                ps2.setString(3, rs.getString("service_type"));

                ps2.executeUpdate();
            }

            // Redirect to history page
            response.sendRedirect("history.jsp?success=true");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}