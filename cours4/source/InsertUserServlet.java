import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({"/InsertUserServlet"})
public class InsertUserServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String username = request.getParameter("username");
      String email = request.getParameter("email");
      String city = request.getParameter("city");
      String date_of_birth = request.getParameter("date_of_birth");

      try {
         String jdbcUrl = "jdbc:postgresql://localhost:5432/mywebapp";
         String dbUser = "userdb";
         String dbPassword = "sokh";
         Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
         String insertQuery = "INSERT INTO users (username, email,city,date_of_birth) VALUES (?, ?,?, ?)";
         PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
         preparedStatement.setString(1, username);
         preparedStatement.setString(2, email);
         preparedStatement.setString(3, city);
         preparedStatement.setString(4, date_of_birth);
         preparedStatement.executeUpdate();
         preparedStatement.close();
         connection.close();
         response.setCharacterEncoding("UTF-8");
         response.sendRedirect("success.jsp?username=" + username);
      } catch (SQLException var13) {
         var13.printStackTrace();
         response.sendRedirect("error.jsp");
      }

   }
}
