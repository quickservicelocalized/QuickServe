package quickserve;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/EarningsServlet")
public class EarningsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");

        PrintWriter out = response.getWriter();

        JSONArray arr = new JSONArray();

        try {

            Connection con = DBConnection.getConnection();

            HttpSession session = request.getSession(false);

            if(session == null){
                return;
            }

            int providerId = (int) session.getAttribute("providerId");

            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM bookings WHERE provider_id=? AND status='COMPLETED'"
            );

            ps.setInt(1, providerId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                JSONObject obj = new JSONObject();

                obj.put("booking_id", rs.getInt("id"));
                obj.put("service", rs.getString("service_type"));
                obj.put("date", rs.getTimestamp("booking_date"));
                obj.put("amount", rs.getDouble("price"));

                arr.put(obj);
            }

            out.print(arr);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}