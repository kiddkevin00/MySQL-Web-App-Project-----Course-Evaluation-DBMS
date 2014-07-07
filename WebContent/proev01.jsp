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

	//Connection conn4 = null;

	ResultSet rset = null;
	ResultSet rset2 = null;
	ResultSet rset3 = null;
	//ResultSet rset4 = null; 

	String error_msg = "";
	String search_msg = "";
	try {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:mh3346/AXkyWRRw@//w4111b.cs.columbia.edu:1521/ADB");

		conn = ods.getConnection();
		Statement stmt = conn.createStatement();
		rset = stmt
				.executeQuery("select P.pname, C.cname, G.creditforprofessorofcourse from givecredittoprofessor G,professorteachunder P,coursein C where  P.pid=G.pid AND P.pid='001' AND C.cid='010' AND C.cid=G.cid");

		conn2 = ods.getConnection();
		stmt = conn2.createStatement();
		rset2 = stmt
				.executeQuery("select P.pname, C.cname, G.creditforprofessorofcourse from givecredittoprofessor G,professorteachunder P,coursein C where  P.pid=G.pid AND P.pid='002' AND C.cid='011' AND C.cid=G.cid");

		conn3 = ods.getConnection();
		stmt = conn3.createStatement();
		rset3 = stmt
				.executeQuery("select P.pname, C.cname, G.creditforprofessorofcourse from givecredittoprofessor G,professorteachunder P,coursein C where  P.pid=G.pid AND P.pid='003' AND C.cid='012' AND C.cid=G.cid");

		/*conn4 = ods.getConnection();
		 stmt = conn4.createStatement();
		 rset4 = stmt.executeQuery("select P.pname, C.cname, G.creditforprofessorofcourse from givecredittoprofessor G,professorteachunder P,coursein C where  P.pid=G.pid AND P.pid='004' AND C.cid='013' AND C.cid=G.cid"); 
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
<title>proev01</title>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
</head>

<body
	background="http://freefever.com/stock/latest-blue-vintage-background-background-patterns-others.jpg">

	<a title="Click here to find out the evaluation of TA"
		href="http://localhost:9080/CS4111/ta1.jsp">Evaluation of TA </a>
	<br>
	<a title="Click here to find out the academic degree of professor"
		href="http://localhost:9080/CS4111/prode1.jsp">Prfessor Degree</a>
	<br>
	<br>

	<div align="center">
		<h1>Click the following professors' names to find the evaluation
			of each course they taught</h1>
		<form name="registerForm" action="proev01.jsp" method="post">
			<input type="button" title="EE" value="SMITH" id="pro1"> <input
				type="button" title="CS" value="BROWN" id="pro2"> <input
				type="button" title="Chemistry" value="HOSKIN" id="pro3">
			<!-- input type="button" title="Physic"value="LEE" id="pro4">  -->
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
		<a href="http://localhost:9080/CS4111/proavg.jsp">Check the
			average evaluation of each professor</a> <br> <a
			href="http://localhost:9080/CS4111/proev02.jsp">Find more</a>
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
					out.print("<th>" + "PROFESSOR" + "</th><th>" + "COURSE"
							+ "</th><th>" + "EVALUATION" + "</th>");
					out.print("</tr>");
					out.print("<tr>");
					out.print("<td>" + rset.getString("pname") + "</td><td>"
							+ rset.getString("cname") + "</td><td>"
							+ rset.getString("creditforprofessorofcourse")
							+ "</td>");
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
					out.print("<th>" + "PROFESSOR" + "</th><th>" + "COURSE"
							+ "</th><th>" + "EVALUATION" + "</th>");
					out.print("</tr>");
					out.print("<tr>");
					out.print("<td>" + rset2.getString("pname") + "</td><td>"
							+ rset2.getString("cname") + "</td><td>"
							+ rset2.getString("creditforprofessorofcourse")
							+ "</td>");
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
					out.print("<th>" + "PROFESSOR" + "</th><th>" + "COURSE"
							+ "</th><th>" + "EVALUATION" + "</th>");
					out.print("</tr>");
					out.print("<tr>");
					out.print("<td>" + rset3.getString("pname") + "</td><td>"
							+ rset3.getString("cname") + "</td><td>"
							+ rset3.getString("creditforprofessorofcourse")
							+ "</td>");
					out.print("</tr>");
				}
			} else {
				out.print(error_msg);
			}
			if (conn3 != null) {
				conn3.close();
			}%>
		');
		}
	</script>

	<!--  
<script> 
  $(document).ready(function(){
	$('#pro4').click(function(){
	  	  search4();
	  });	
	
});
 
 
function search4(){
	$('#result4').append('<%/*
			 > if(rset4 != null) { 
			 while(rset4.next()) { 
			 out.print("<tr>");
			 out.print("<th>"+"PROFESSOR"+"</th><th>"+"COURSE"+"</th><th>"+"EVALUATION"+"</th>");
			 out.print("</tr>"); 
			 out.print("<tr>"); 
			 out.print("<td>" + rset4.getString("pname")  + "</td><td>" + rset4.getString("cname") + "</td><td>" + rset4.getString("creditforprofessorofcourse")+"</td>");
			 out.print("</tr>"); 
			 } 
			 } else { 
			 out.print(error_msg); 
			 } 
			 if( conn4 != null ) { 
			 conn4.close(); 
			 } 
			 */%> ');
  }
  </script> 
 -->




</body>
</html>
