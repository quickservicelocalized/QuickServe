package quickserve;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteProviderServlet")
public class DeleteProviderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String id = request.getParameter("id");

        try {
            Connection con = DBConnection.getConnection();

            // 🔥 IMPORTANT: delete related bookings first
            PreparedStatement ps1 = con.prepareStatement(
                "DELETE FROM bookings WHERE provider_id=?"
            );
            ps1.setInt(1, Integer.parseInt(id));
            ps1.executeUpdate();

            // 🔥 then delete provider
            PreparedStatement ps2 = con.prepareStatement(
                "DELETE FROM providers WHERE id=?"
            );
            ps2.setInt(1, Integer.parseInt(id));
            ps2.executeUpdate();

            response.sendRedirect("AdminDashboardServlet");

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}