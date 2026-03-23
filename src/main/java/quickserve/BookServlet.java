package quickserve;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/BookServlet")
public class BookServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        try {

            // ✅ Get parameters
            int providerId = Integer.parseInt(request.getParameter("providerId"));
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String location = request.getParameter("location");

            HttpSession session = request.getSession();
            String customerName = (String) session.getAttribute("customerName");

            // 🔴 DEBUG (VERY IMPORTANT)
            System.out.println("Provider: " + providerId);
            System.out.println("Date: " + date);
            System.out.println("Time: " + time);
            System.out.println("Location: " + location);
            System.out.println("Customer: " + customerName);

            Connection con = DBConnection.getConnection();

            // ✅ Get provider details
            PreparedStatement ps1 = con.prepareStatement(
                "SELECT name, service_type, price FROM providers WHERE id=?"
            );
            ps1.setInt(1, providerId);

            ResultSet rs = ps1.executeQuery();

            if(rs.next()){

                String providerName = rs.getString("name");
                String serviceType = rs.getString("service_type");
                double price = rs.getDouble("price");

                // ✅ Insert booking
                PreparedStatement ps2 = con.prepareStatement(
                    "INSERT INTO bookings(provider_id, provider_name, service_type, booking_date, customer_name, status, price, location) VALUES(?,?,?,?,?,?,?,?)"
                );

                ps2.setInt(1, providerId);
                ps2.setString(2, providerName);
                ps2.setString(3, serviceType);
                ps2.setString(4, date + " " + time);
                ps2.setString(5, customerName);
                ps2.setString(6, "PENDING");
                ps2.setDouble(7, price);
                ps2.setString(8, location);

                int rows = ps2.executeUpdate();

                System.out.println("Inserted Rows: " + rows); // DEBUG
            }

            // ✅ REDIRECT (IMPORTANT FIX)
            response.sendRedirect(request.getContextPath() + "/customer/history.jsp?success=true");

        } catch(Exception e){
            e.printStackTrace();

            // ❌ Show error instead of blank page
            response.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}