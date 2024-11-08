import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/YouthCampServlet")
public class YouthCampServlet extends HttpServlet {
    // Your servlet implementation


    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/student_health_wellness";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "GSK&ydk1";
    private static final Logger logger = Logger.getLogger(YouthCampServlet.class.getName());

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            logger.log(Level.SEVERE, "Database driver not found", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String ageStr = request.getParameter("age");
        String gender = request.getParameter("gender");
        String camp = request.getParameter("camp");
        String tshirtSize = request.getParameter("tshirt_size");
        String allergies = request.getParameter("allergies");
        String emergencyContactName = request.getParameter("emergency_contact_name");
        String emergencyContactPhone = request.getParameter("emergency_contact_phone");
        String comments = request.getParameter("comments");

        // Validate input
        if (name == null || email == null || phone == null || ageStr == null || gender == null ||
            camp == null || tshirtSize == null || emergencyContactName == null || emergencyContactPhone == null) {
            handleError(response, "Missing required fields. Please complete all fields.");
            return;
        }

        int age;
        try {
            // Validate and parse age
            age = Integer.parseInt(ageStr);
            if (age <= 0) {
                handleError(response, "Age must be a positive number.");
                return;
            }
        } catch (NumberFormatException e) {
            handleError(response, "Invalid age format. Please enter a valid number.");
            return;
        }

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            if (insertRegistration(conn, name, email, phone, age, gender, camp, tshirtSize, allergies, emergencyContactName, emergencyContactPhone, comments)) {
                sendSuccessResponse(response, name, camp);
            } else {
                handleError(response, "Failed to register for the youth camp. Please try again.");
            }
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Database error occurred", e);
            handleError(response, "There was an error connecting to the database. Please try again later.");
        }
    }

    private boolean insertRegistration(Connection conn, String name, String email, String phone, int age, String gender,
                                        String camp, String tshirtSize, String allergies, String emergencyContactName,
                                        String emergencyContactPhone, String comments) throws SQLException {
        String sql = "INSERT INTO youth_camp_registrations (name, email, phone, age, gender, camp, tshirt_size, allergies, emergency_contact_name, emergency_contact_phone, comments) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, phone);
            stmt.setInt(4, age);
            stmt.setString(5, gender);
            stmt.setString(6, camp);
            stmt.setString(7, tshirtSize);
            stmt.setString(8, allergies);
            stmt.setString(9, emergencyContactName);
            stmt.setString(10, emergencyContactPhone);
            stmt.setString(11, comments);
            return stmt.executeUpdate() > 0;
        }
    }

    private void sendSuccessResponse(HttpServletResponse response, String name, String camp) throws IOException {
        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
            out.println("<html><body><h3>Registration successful!</h3>");
            out.println("<p>Thank you, " + name + ". Your registration for the " + camp + " has been received.</p>");
            out.println("<p><a href='youthcampreg.jsp'>Back to Registration Form</a></p>");
            out.println("</body></html>");
        }
    }

    private void handleError(HttpServletResponse response, String message) throws IOException {
        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
            out.println("<html><body><h3>Error occurred!</h3>");
            out.println("<p>" + message + "</p>");
            out.println("<p><a href='youthcampreg.jsp'>Back to Registration Form</a></p>");
            out.println("</body></html>");
        }
    }
}
