import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({"/UserServlet"})
public class UserServlet extends HttpServlet {
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      response.setContentType("text/html");
      PrintWriter out = response.getWriter();
      Connection conn = null;

      try {
         Class.forName(this.getServletContext().getInitParameter("dbDriver"));
         conn = DriverManager.getConnection(this.getServletContext().getInitParameter("dbUrl"), this.getServletContext().getInitParameter("dbUsername"), this.getServletContext().getInitParameter("dbPassword"));
         String sql = "SELECT username, email,city,date_of_birth FROM users";
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery(sql);
         out.println("<html><body>");
         out.println("<h2>User List</h2>");
         out.println("<ul>");

         while(rs.next()) {
            out.println("<li>Username: " + rs.getString("username") + ", Email: " + rs.getString("email") + ", City: " + rs.getString("city") + ", date_of_birth: " + rs.getString("date_of_birth") + "</li>");
         }

         out.println("</ul>");
         out.println("</body></html>");
         rs.close();
         stmt.close();
         conn.close();
      } catch (SQLException | ClassNotFoundException var16) {
         var16.printStackTrace();
         response.sendRedirect("error.jsp");
      } finally {
         if (conn != null) {
            try {
               conn.close();
            } catch (SQLException var15) {
               var15.printStackTrace();
            }
         }

      }

   }
}
