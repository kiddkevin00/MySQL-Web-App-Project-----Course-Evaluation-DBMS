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
				.executeQuery("select C.cname, G.TAid,G.creditforTAofcourse from givecredittoTA G,coursein C,TAassist T where G.TAid=T.TAid AND C.cid=G.cid AND T.TAid='01' AND C.cid='010'");

		conn2 = ods.getConnection();
		stmt = conn2.createStatement();
		rset2 = stmt
				.executeQuery("select C.cname, G.TAid,G.creditforTAofcourse from givecredittoTA G,coursein C,TAassist T where G.TAid=T.TAid AND C.cid=G.cid AND T.TAid='02' AND C.cid='011'");

		conn3 = ods.getConnection();
		stmt = conn3.createStatement();
		rset3 = stmt
				.executeQuery("select C.cname, G.TAid,G.creditforTAofcourse from givecredittoTA G,coursein C,TAassist T where G.TAid=T.TAid AND C.cid=G.cid AND T.TAid='03' AND C.cid='012'");

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
<title>ta1</title>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
</head>

<body
	background="http://freefever.com/stock/latest-blue-vintage-background-background-patterns-others.jpg">

	<a
		title="Click here to find out the evaluation of the professor's teaching"
		href="http://localhost:9080/CS4111/proev01.jsp">Evaluation of
		professors </a>
	<br>
	<a title="Click here to find out the academic degree of professor"
		href="http://localhost:9080/CS4111/prode1.jsp">Professor Degree</a>
	<br>
	<br>

	<div align="center">
		<h1>Click the following TA's ID to check the evaluation of each
			course they assist</h1>
		<form name="registerForm" action="register" method="post">
			<input type="button" title="EE" value="01" id="pro1"> <input
				type="button" title="CS" value="02" id="pro2"> <input
				type="button" title="Chemistry" value="03" id="pro3">
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
		<a href="http://localhost:9080/CS4111/TAavg.jsp">Check the average
			evaluation of each TA</a> <br> <a
			href="http://localhost:9080/CS4111/ta2.jsp">Find more</a>
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
					out.print("<th>" + "TA ID" + "</th><th>" + "COURSE"
							+ "</th><th>" + "EVALUATION" + "</th>");
					out.print("</tr>");
					out.print("<tr>");
					out.print("<td>" + rset.getString("TAid") + "</td><td>"
							+ rset.getString("cname") + "</td><td>"
							+ rset.getString("creditforTAofcourse") + "</td>");
					out.print("</tr>");
				}

			} else {
				out.print(error_msg);
			}
			if (conn != null) {
				conn.close();
			}%>');
				$('#result2').html('');
				$('#result3').html('');
	
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
					out.print("<th>" + "TA ID" + "</th><th>" + "COURSE"
							+ "</th><th>" + "EVALUATION" + "</th>");
					out.print("</tr>");
					out.print("<tr>");
					out.print("<td>" + rset2.getString("TAid") + "</td><td>"
							+ rset2.getString("cname") + "</td><td>"
							+ rset2.getString("creditforTAofcourse") + "</td>");
					out.print("</tr>");
				}

			} else {
				out.print(error_msg);
			}
			if (conn2 != null) {
				conn2.close();
			}%>');
	$('#result1').html('');
	$('#result3').html('');
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
					out.print("<th>" + "TA ID" + "</th><th>" + "COURSE"
							+ "</th><th>" + "EVALUATION" + "</th>");
					out.print("</tr>");
					out.print("<tr>");
					out.print("<td>" + rset3.getString("TAid") + "</td><td>"
							+ rset3.getString("cname") + "</td><td>"
							+ rset3.getString("creditforTAofcourse") + "</td>");
					out.print("</tr>");
				}

			} else {
				out.print(error_msg);
			}
			if (conn3 != null) {
				conn3.close();
			}%>');
			$('#result2').html('');
			$('#result1').html('');
		}
	</script>





</body>
</html>
