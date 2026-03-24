package quickserve;

import java.io.IOException;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AddServiceServlet")
public class AddServiceServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException {

        try {

            HttpSession session = request.getSession(false);

            if(session == null || session.getAttribute("providerId") == null){
                response.getWriter().println("Session expired");
                return;
            }

            int providerId = Integer.parseInt(session.getAttribute("providerId").toString());

            String serviceName = request.getParameter("serviceName");
            String description =request.getParameter("description");
            double price = Double.parseDouble(request.getParameter("price"));
            int discount = Integer.parseInt(request.getParameter("discount"));
            
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO services(provider_id, service_name, description, price, discount, availability) VALUES(?,?,?,?,?,?)"
            );

            ps.setInt(1, providerId);
            ps.setString(2, serviceName);
            ps.setString(3, description);
            ps.setDouble(4, price);
            ps.setInt(5, discount);
            ps.setString(6, "AVAILABLE");

            ps.executeUpdate();

            response.sendRedirect(request.getContextPath() + "/provider/providerProfile.jsp");

        } catch(Exception e){
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}