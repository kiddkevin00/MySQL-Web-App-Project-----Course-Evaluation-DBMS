<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">

<!-- This import is necessary for JDBC -->
<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>

<!-- Database lookup -->
<%
	Connection conn = null;
	Connection conn2 = null;
	Connection conn3 = null;

	ResultSet rset = null;
	ResultSet rset2 = null;
	ResultSet rset3 = null;

	String error_msg = "";
	String search_msg = "";
	try {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:mh3346/AXkyWRRw@//w4111b.cs.columbia.edu:1521/ADB");

		conn = ods.getConnection();
		Statement stmt = conn.createStatement();
		rset = stmt
				.executeQuery("select P.pname,P.diploma from professorteachunder P where P.pid='001'");

		conn2 = ods.getConnection();
		stmt = conn2.createStatement();
		rset2 = stmt
				.executeQuery("select P.pname,P.diploma from professorteachunder P where P.pid='002'");

		conn3 = ods.getConnection();
		stmt = conn3.createStatement();
		rset3 = stmt
				.executeQuery("select P.pname,P.diploma from professorteachunder P where P.pid='003'");

		/*
		 conn4 = ods.getConnection();
		 stmt = conn4.createStatement();
		 rset4 = stmt.executeQuery("select P.pname, C.cname, G.creditforprofessorofcourse from givecredittoprofessor G,professorteachunder P,coursein C where  P.pid=G.pid AND P.pid='004' AND C.cid='013' AND C.cid=G.cid"); 

		 conn5 = ods.getConnection();
		 stmt = conn5.createStatement();
		 rset5 = stmt.executeQuery("select P.pname, C.cname, G.creditforprofessorofcourse from givecredittoprofessor G,professorteachunder P,coursein C where  P.pid=G.pid AND P.pid='005' AND C.cid='014' AND C.cid=G.cid"); 
		 */

	} catch (SQLException e) {
		error_msg = e.getMessage();
		if (conn != null) {
			conn.close();
		}
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>prode1</title>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
</head>

<body
	background="http://freefever.com/stock/latest-blue-vintage-background-background-patterns-others.jpg">

	<a
		title="Click here to find out the evaluation of the professor's teaching"
		href="http://localhost:9080/CS4111/proev01.jsp">Evaluation of
		professors </a>
	<br>
	<a title="Click here to find out the evaluation of TA"
		href="http://localhost:9080/CS4111/ta1.jsp">Evaluation of TA</a>
	<br>
	<br>

	<div align="center">
		<h1>Click the following professors' names to check the degree of
			each professor</h1>
		<form id="registerForm" action="register" method="post">
			<input type="button" title="EE" value="SMITH" id="pro1"> <input
				type="button" title="CS" value="BROWN" id="pro2"> <input
				type="button" title="Chemistry" value="HOSKIN" id="pro3">
		</form>
	</div>

	<div id="001" align="center" style="border: 5px solid brown">
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

		<a href="http://localhost:9080/CS4111/prode2.jsp">Find more</a>
	</div>


	<script> 
$(document).ready(function(){
	$('#pro1').click(function(){
	  	  search1();
	  });	
});

function search1(){
	$('#result1').html('<%if (rset != null) {

				while (rset.next()) {
					out.print("<tr>");
					out.print("<th>" + "PROFESSOR" + "</th><th>" + "DEGREE"
							+ "</th>");
					out.print("</tr>");
					out.print("<tr>");
					out.print("<td>" + rset.getString("pname") + "</td><td>"
							+ rset.getString("diploma") + "</td>");
					out.print("</tr>");
				}
			} else {
				out.print(error_msg);
			}
			if (conn != null) {
				conn.close();
			}%>');
  }
  </script>

	<script> 
$(document).ready(function(){
	$('#pro2').click(function(){
	  	  search2();
	  });	
});

function search2(){
	$('#result2').html('<%if (rset2 != null) {
				while (rset2.next()) {
					out.print("<tr>");
					out.print("<th>" + "PROFESSOR" + "</th><th>" + "DEGREE"
							+ "</th>");
					out.print("</tr>");
					out.print("<tr>");
					out.print("<td>" + rset2.getString("pname") + "</td><td>"
							+ rset2.getString("diploma") + "</td>");
					out.print("</tr>");
				}
			} else {
				out.print(error_msg);
			}
			if (conn2 != null) {
				conn2.close();
			}%> ');
  }
  </script>

	<script> 
$(document).ready(function(){
	$('#pro3').click(function(){
	  	  search3();
	  });	
});

function search3(){
	$('#result3').html('<%if (rset3 != null) {
				while (rset3.next()) {
					out.print("<tr>");
					out.print("<th>" + "PROFESSOR" + "</th><th>" + "DEGREE"
							+ "</th>");
					out.print("</tr>");
					out.print("<tr>");
					out.print("<td>" + rset3.getString("pname") + "</td><td>"
							+ rset3.getString("diploma") + "</td>");
					out.print("</tr>");
				}
			} else {
				out.print(error_msg);
			}
			if (conn3 != null) {
				conn3.close();
			}%>');
		}
	</script>




</body>
</html>
