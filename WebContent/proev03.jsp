<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">

<!-- This import is necessary for JDBC -->
<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>

<!-- Database lookup -->
<%
	Connection conn8 = null;
	Connection conn9 = null;
	Connection conn10 = null;

	ResultSet rset8 = null;
	ResultSet rset9 = null;
	ResultSet rset10 = null;

	String error_msg = "";
	String search_msg = "";
	try {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:mh3346/AXkyWRRw@//w4111b.cs.columbia.edu:1521/ADB");

		conn8 = ods.getConnection();
		Statement stmt = conn8.createStatement();
		rset8 = stmt
				.executeQuery("select P.pname, C.cname, G.creditforprofessorofcourse from givecredittoprofessor G,professorteachunder P,coursein C where  P.pid=G.pid AND P.pid='008' AND C.cid='017' AND C.cid=G.cid");

		conn9 = ods.getConnection();
		stmt = conn9.createStatement();
		rset9 = stmt
				.executeQuery("select P.pname, C.cname, G.creditforprofessorofcourse from givecredittoprofessor G,professorteachunder P,coursein C where  P.pid=G.pid AND P.pid='009' AND C.cid='018' AND C.cid=G.cid");

		conn10 = ods.getConnection();
		stmt = conn10.createStatement();
		rset10 = stmt
				.executeQuery("select P.pname, C.cname, G.creditforprofessorofcourse from givecredittoprofessor G,professorteachunder P,coursein C where  P.pid=G.pid AND P.pid='010' AND C.cid='019' AND C.cid=G.cid");

	} catch (SQLException e) {
		error_msg = e.getMessage();
		if (conn8 != null) {
			conn8.close();
		}
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>proev03</title>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
</head>

<body
	background="http://freefever.com/stock/latest-blue-vintage-background-background-patterns-others.jpg">

	<a title="Click to find out the evaluation of TA"
		href="http://localhost:9080/CS4111/ta1.jsp">Evaluation of TA </a>
	<br>
	<a title="Click to find out the academic degree of professor"
		href="http://localhost:9080/CS4111/prode1.jsp">Prfessor Degree</a>
	<br>
	<br>

	<div align="center">
		<h1>Click the following professors' names to find the evaluation
			of each course they taught</h1>
		<form name="registerForm" action="register" method="post">

			<input type="button" title="History" value="YI" id="pro8"> <input
				type="button" title="OR" value="SHOE" id="pro9"> <input
				type="button" title="English" value="DOE" id="pro10">
		</form>
	</div>

	<div align="center" style="border: 5px solid brown">
		<div>
			<em>note: if you click the same button more than once, the
				system will automatically arrange the results in order </em>
			<table id="result1" border="1" bgcolor="#C8C8C8">
			</table>
		</div>

		<div>
			<table id="result2" border="1" bgcolor="#C8C8C8">
			</table>
		</div>

		<div>
			<table id="result3" border="1" bgcolor="#C8C8C8">
			</table>
		</div>

		<div>
			<table id="result4" border="1" bgcolor="#C8C8C8">
			</table>
		</div>

		<div>
			<table id="result5" border="1" bgcolor="#C8C8C8">
			</table>
		</div>

		<div>
			<table id="result6" border="1" bgcolor="#C8C8C8">
			</table>
		</div>

		<div>
			<table id="result7" border="1" bgcolor="#C8C8C8">
			</table>
		</div>

		<div>
			<table id="result8" border="1" bgcolor="#C8C8C8">
			</table>
		</div>

		<div>
			<table id="result9" border="1" bgcolor="#C8C8C8">
			</table>
		</div>

		<div>
			<table id="result10" border="1" bgcolor="#C8C8C8">
			</table>
		</div>
		<a href="http://localhost:9080/CS4111/proavg3.jsp">Check the
			average evaluation of each professor</a> <br> <a
			href="http://localhost:9080/CS4111/proev02.jsp"> Previous page
		</a>
	</div>




	<script> 
  $(document).ready(function(){
	$('#pro8').click(function(){
	  	  search8();
	  });	
}); 
function search8(){
	$('#result8').html('<%if (rset8 != null) {
				while (rset8.next()) {
					out.print("<tr>");
					out.print("<th>" + "PROFESSOR" + "</th><th>" + "COURSE"
							+ "</th><th>" + "EVALUATION" + "</th>");
					out.print("</tr>");
					out.print("<tr>");
					out.print("<td>" + rset8.getString("pname") + "</td><td>"
							+ rset8.getString("cname") + "</td><td>"
							+ rset8.getString("creditforprofessorofcourse")
							+ "</td>");
					out.print("</tr>");
				}
			} else {
				out.print(error_msg);
			}
			if (conn8 != null) {
				conn8.close();
			}%> ');
  }
  </script>

	<script> 
  $(document).ready(function(){
	$('#pro9').click(function(){
	  	  search9();
	  });	
}); 
function search9(){
	$('#result9').html('<%if (rset9 != null) {
				while (rset9.next()) {
					out.print("<tr>");
					out.print("<th>" + "PROFESSOR" + "</th><th>" + "COURSE"
							+ "</th><th>" + "EVALUATION" + "</th>");
					out.print("</tr>");
					out.print("<tr>");
					out.print("<td>" + rset9.getString("pname") + "</td><td>"
							+ rset9.getString("cname") + "</td><td>"
							+ rset9.getString("creditforprofessorofcourse")
							+ "</td>");
					out.print("</tr>");
				}
			} else {
				out.print(error_msg);
			}
			if (conn9 != null) {
				conn9.close();
			}%> ');
  }
  </script>

	<script> 
  $(document).ready(function(){
	$('#pro10').click(function(){
	  	  search10();
	  });	
});
function search10(){
	$('#result10').html('<%if (rset10 != null) {
				while (rset10.next()) {
					out.print("<tr>");
					out.print("<th>" + "PROFESSOR" + "</th><th>" + "COURSE"
							+ "</th><th>" + "EVALUATION" + "</th>");
					out.print("</tr>");
					out.print("<tr>");
					out.print("<td>" + rset10.getString("pname") + "</td><td>"
							+ rset10.getString("cname") + "</td><td>"
							+ rset10.getString("creditforprofessorofcourse")
							+ "</td>");
					out.print("</tr>");
				}
			} else {
				out.print(error_msg);
			}
			if (conn10 != null) {
				conn10.close();
			}%>
		');
		}
	</script>


</body>
</html>
