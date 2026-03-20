package quickserve;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AddServiceServlet")
public class AddServiceServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String serviceName = request.getParameter("service_name");
        String description = request.getParameter("description");
        String price = request.getParameter("price");

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO services(service_name, description, price, image) VALUES (?, ?, ?, ?)"
            );

            ps.setString(1, serviceName);
            ps.setString(2, description);
            ps.setDouble(3, Double.parseDouble(price));
            ps.setString(4, "default.png");

            ps.executeUpdate();

            // Redirect back inside dashboard iframe
            response.sendRedirect("provider/addService.jsp?success=true");

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}