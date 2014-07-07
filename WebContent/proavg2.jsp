<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">

<!-- This import is necessary for JDBC -->
<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>

<!-- Database lookup -->
<%
	Connection conn5 = null;
	Connection conn6 = null;
	Connection conn7 = null;

	ResultSet rset5 = null;
	ResultSet rset6 = null;
	ResultSet rset7 = null;

	String error_msg = "";
	String search_msg = "";
	try {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:mh3346/AXkyWRRw@//w4111b.cs.columbia.edu:1521/ADB");

		conn5 = ods.getConnection();
		Statement stmt = conn5.createStatement();
		rset5 = stmt
				.executeQuery("select C.cname, T.pname,AVG(G.creditforprofessorofcourse) AS avg from givecredittoprofessor G,coursein C, professorteachunder T where G.pid=T.pid AND C.cid=G.cid AND T.pid='001' AND C.cid='010' GROUP BY C.cname, T.pname");
		conn6 = ods.getConnection();
		stmt = conn6.createStatement();
		rset6 = stmt
				.executeQuery("select C.cname, T.pname,AVG(G.creditforprofessorofcourse) AS avg from givecredittoprofessor G,coursein C, professorteachunder T where G.pid=T.pid AND C.cid=G.cid AND T.pid='002' AND C.cid='011' GROUP BY C.cname, T.pname");

		conn7 = ods.getConnection();
		stmt = conn7.createStatement();
		rset7 = stmt
				.executeQuery("select C.cname, T.pname,AVG(G.creditforprofessorofcourse) AS avg from givecredittoprofessor G,coursein C, professorteachunder T where G.pid=T.pid AND C.cid=G.cid AND T.pid='003' AND C.cid='012' GROUP BY C.cname, T.pname");

	} catch (SQLException e) {
		error_msg = e.getMessage();
		if (conn5 != null) {
			conn5.close();
		}
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>proev02</title>
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
		<h1>Click the following professors' names to find the AVERAGE
			evaluation of each course they taught</h1>
		<form name="registerForm" action="register" method="post">
			<input type="button" title="EE" value="SMITH" id="pro5"> <input
				type="button" title="CS" value="BROWN" id="pro6"> <input
				type="button" title="Chemistry" value="HOSKIN" id="pro7">
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
		<a href="http://localhost:9080/CS4111/proev01.jsp"> Go back</a>
	</div>




	<script> 
  $(document).ready(function(){
	$('#pro5').click(function(){
	  	  search5();
	  });	
});
function search5(){
	$('#result5').html('<%if (rset5 != null) {
				while (rset5.next()) {
					out.print("<tr>");
					out.print("<th>" + "PROFESSOR" + "</th><th>" + "COURSE"
							+ "</th><th>" + "AVERAGE" + "</th>");
					out.print("</tr>");
					out.print("<tr>");
					out.print("<td>" + rset5.getString("pname") + "</td><td>"
							+ rset5.getString("cname") + "</td><td>"
							+ rset5.getString("avg") + "</td>");
					out.print("</tr>");
				}
			} else {
				out.print(error_msg);
			}
			if (conn5 != null) {
				conn5.close();
			}%> ');
  }
  </script>




	<script>
  $(document).ready(function(){
	$('#pro6').click(function(){
	  	  search6();
	  });	
});
function search6(){
	$('#result6').html('<%if (rset6 != null) {
				while (rset6.next()) {
					out.print("<tr>");
					out.print("<th>" + "PROFESSOR" + "</th><th>" + "COURSE"
							+ "</th><th>" + "AVERAGE" + "</th>");
					out.print("</tr>");
					out.print("<tr>");
					out.print("<td>" + rset6.getString("pname") + "</td><td>"
							+ rset6.getString("cname") + "</td><td>"
							+ rset6.getString("avg") + "</td>");
					out.print("</tr>");
				}
			} else {
				out.print(error_msg);
			}
			if (conn6 != null) {
				conn6.close();
			}%> ');
  }
  </script>

	<script> 
  $(document).ready(function(){
	$('#pro7').click(function(){
	  	  search7();
	  });	
}); 
function search7(){
	$('#result7').html('<%if (rset7 != null) {
				while (rset7.next()) {
					out.print("<tr>");
					out.print("<th>" + "PROFESSOR" + "</th><th>" + "COURSE"
							+ "</th><th>" + "AVERAGE" + "</th>");
					out.print("</tr>");
					out.print("<tr>");
					out.print("<td>" + rset7.getString("pname") + "</td><td>"
							+ rset7.getString("cname") + "</td><td>"
							+ rset7.getString("avg") + "</td>");
					out.print("</tr>");
				}
			} else {
				out.print(error_msg);
			}
			if (conn7 != null) {
				conn7.close();
			}%>
		');
		}
	</script>



</body>
</html>
