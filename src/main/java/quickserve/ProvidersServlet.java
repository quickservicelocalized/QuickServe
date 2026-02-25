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

	    try {
	        Connection con = DBConnection.getConnection();

	        PreparedStatement ps = con.prepareStatement(
	            "SELECT * FROM providers WHERE service_type=?"
	        );

	        ps.setString(1, serviceName);

	        ResultSet rs = ps.executeQuery();

	        java.util.List<java.util.Map<String, Object>> providers = new java.util.ArrayList<>();

	        while (rs.next()) {
	            java.util.Map<String, Object> row = new java.util.HashMap<>();
	            row.put("id", rs.getInt("id"));
	            row.put("name", rs.getString("name"));
	            row.put("price", rs.getDouble("price"));
	            row.put("experience", rs.getInt("experience"));
	            row.put("rating", rs.getDouble("rating"));
	            providers.add(row);
	        }

	        request.setAttribute("providers", providers);
	        request.setAttribute("serviceName", serviceName);

	        RequestDispatcher rd = request.getRequestDispatcher("providers.jsp");
	        rd.forward(request, response);

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
}