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
	private static final String connect_string = "jdbc:mysql://127.0.0.1/MyCluster";
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
				// Create a OracleDataSource instance and set URL
				// OracleDataSource ods = new OracleDataSource();
				// ods.setURL(connect_string);
				// conn = ods.getConnection();

				String URL = "jdbc:mysql://127.0.0.1/MyCluster";
				String USER = "kiddkevin01";
				String PASSWORD = "";
				String DRIVER_CLASS = "com.mysql.jdbc.Driver";
				Class.forName(DRIVER_CLASS);
				System.setProperty(DRIVER_CLASS, "");
				conn = DriverManager
						.getConnection("jdbc:mysql://localhost:3307/?"
								+ "user=kiddkevin01&password=d6cebdgb");
			}
			Statement stmt = conn.createStatement();

			ResultSet rset = stmt.executeQuery("select dname from department");

			response.setContentType("text/html");
			pw.println("<html>");
			pw.println("<head><title>department Table Servlet Sample</title></head>");
			pw.println("<H1>Show department Table Data <BR></H1>");
			pw.println("<body><BR>");
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
		// TODO Auto-generated method stub
	}

}