package quickserve;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ProvidersServlet")
public class ProvidersServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String serviceName = request.getParameter("serviceName");
        String rating = request.getParameter("rating");
        String price = request.getParameter("price");
        String discount = request.getParameter("discount");

        try {
            Connection con = DBConnection.getConnection();

            StringBuilder sql = new StringBuilder(
                "SELECT * FROM providers WHERE 1=1"
            );

           
            if (serviceName != null && !serviceName.isEmpty()) {
                sql.append(" AND service_type = ?");
            }

           
            if (rating != null && !rating.isEmpty()) {
                sql.append(" AND rating >= ?");
            }

           
            if (price != null && !price.isEmpty()) {
                sql.append(" AND price BETWEEN ? AND ?");
            }

           
            if (discount != null && !discount.isEmpty()) {
                sql.append(" AND discount >= ?");
            }

            PreparedStatement ps = con.prepareStatement(sql.toString());

            int index = 1;

            // Set parameters in same order
            if (serviceName != null && !serviceName.isEmpty()) {
                ps.setString(index++, serviceName);
            }

            if (rating != null && !rating.isEmpty()) {
                ps.setDouble(index++, Double.parseDouble(rating));
            }

            if (price != null && !price.isEmpty()) {
                String[] range = price.split("-");
                ps.setDouble(index++, Double.parseDouble(range[0]));
                ps.setDouble(index++, Double.parseDouble(range[1]));
            }

            if (discount != null && !discount.isEmpty()) {
                ps.setInt(index++, Integer.parseInt(discount));
            }

            ResultSet rs = ps.executeQuery();

            java.util.List<java.util.Map<String, Object>> providers =
                    new java.util.ArrayList<>();

            while (rs.next()) {
                java.util.Map<String, Object> row =
                        new java.util.HashMap<>();

                row.put("id", rs.getInt("id"));
                row.put("name", rs.getString("name"));
                row.put("price", rs.getDouble("price"));
                row.put("experience", rs.getInt("experience"));
                row.put("rating", rs.getDouble("rating"));
                row.put("discount", rs.getInt("discount"));

                providers.add(row);
            }

            request.setAttribute("providers", providers);
            request.setAttribute("serviceName", serviceName);

            RequestDispatcher rd =
                    request.getRequestDispatcher("customer/providers.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}