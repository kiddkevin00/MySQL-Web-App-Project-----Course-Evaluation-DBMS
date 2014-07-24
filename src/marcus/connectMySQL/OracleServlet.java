package marcus.connectMySQL;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class OracleServlet
 */
public class OracleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Connection conn;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OracleServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = new PrintWriter(response.getOutputStream());

		try {
			if (conn == null) {
				String databaseName = "ENTER_YOUR_LOCAL_DATABASE_NAME";
				String USER = "ENTER_YOUR_LOCAL_MYSQL_USER_ID";
				String PASSWORD = "ENTER_YOUR_LOCAL_MYSQL_PASSWORD";
				String URL = "jdbc:mysql://localhost/8889/" + databaseName;

				/*
				 * Set JDBC connection, and please check if build path has
				 * included "JDBC.jar"
				 */
				String DRIVER_CLASS = "com.mysql.jdbc.Driver";
				Class.forName(DRIVER_CLASS);
				System.setProperty(DRIVER_CLASS, "");

				/*
				 * (note) Another way to connect to MySQL Create a
				 * OracleDataSource instance and set URL
				 */
				// String connect_string =
				// "jdbc:oracle:thin:userID/password@//url:port/database_name";
				// OracleDataSource ods = new OracleDataSource();
				// ods.setURL(connect_string);
				// conn = ods.getConnection();

				conn = DriverManager.getConnection(URL, USER, PASSWORD);
			}

			Statement stmt = conn.createStatement();

			// Execute SQL statement here..
			ResultSet rset = stmt.executeQuery("select dname from department");

			response.setContentType("text/html");
			pw.println("<html>");
			pw.println("<head><title>department Table Servlet Sample</title></head>");
			pw.println("<H1>Show department Table Data <BR></H1>");
			pw.println("<body><BR>");

			// Print query result here..
			while (rset.next()) {
				pw.println(rset.getString("dname") + "<BR>");
			}
			pw.println("</body></html>");
		} catch (SQLException e) {
			pw.println(e.getMessage());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pw.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}