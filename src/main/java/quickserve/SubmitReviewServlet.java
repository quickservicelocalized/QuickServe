package quickserve;

import java.io.IOException;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


public class SubmitReviewServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException {

        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        int providerId = Integer.parseInt(request.getParameter("providerId"));
        int rating = Integer.parseInt(request.getParameter("rating"));
        String comment = request.getParameter("comment");

        HttpSession session = request.getSession();
        String customerName = (String) session.getAttribute("customerName");

        try {

            Connection con = DBConnection.getConnection();

            // ✅ Check if already reviewed
            PreparedStatement check = con.prepareStatement(
                "SELECT * FROM reviews WHERE booking_id=?"
            );
            check.setInt(1, bookingId);

            ResultSet rs = check.executeQuery();

            if (!rs.next()) {

                // ✅ Insert review WITH booking_id
                PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO reviews(provider_id, customer_name, rating, comment, booking_id) VALUES(?,?,?,?,?)"
                );

                ps.setInt(1, providerId);
                ps.setString(2, customerName);
                ps.setInt(3, rating);
                ps.setString(4, comment);
                ps.setInt(5, bookingId);   // ⭐ FIXED

                ps.executeUpdate();
            }

            // ✅ Update provider average rating
            PreparedStatement avg = con.prepareStatement(
                "UPDATE providers SET rating = (SELECT AVG(rating) FROM reviews WHERE provider_id=?) WHERE id=?"
            );

            avg.setInt(1, providerId);
            avg.setInt(2, providerId);
            avg.executeUpdate();

            response.sendRedirect("customer/history.jsp?review=true");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}