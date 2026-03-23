package quickserve;

import java.io.IOException;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ToggleAvailabilityServlet")   // ✅ MUST BE THIS
public class ToggleAvailabilityServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException {

        try {

            int serviceId = Integer.parseInt(request.getParameter("serviceId"));

            Connection con = DBConnection.getConnection();

            PreparedStatement ps1 = con.prepareStatement(
                "SELECT availability FROM services WHERE id=?"
            );
            ps1.setInt(1, serviceId);

            ResultSet rs = ps1.executeQuery();

            if(rs.next()){
                String current = rs.getString("availability");

                String newStatus = current.equals("AVAILABLE") 
                                   ? "UNAVAILABLE" 
                                   : "AVAILABLE";

                PreparedStatement ps2 = con.prepareStatement(
                    "UPDATE services SET availability=? WHERE id=?"
                );

                ps2.setString(1, newStatus);
                ps2.setInt(2, serviceId);
                ps2.executeUpdate();
            }

            response.sendRedirect(request.getContextPath() + "/provider/providerProfile.jsp");

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}