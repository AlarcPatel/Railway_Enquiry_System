<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="cs336LoginPage.*"%>
<%@ page
	import="java.io.*,java.util.*,java.sql.*,java.time.format.DateTimeFormatter,java.time.LocalDateTime, java.text.SimpleDateFormat, java.util.Date, java.util.Calendar, java.text.ParseException"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FAQ's</title>
</head>
<body>
	<%
		ResultSet faqs = null;
		try{
			ApplicationDB db = new ApplicationDB();
			Connection connection = db.getConnection();
			Statement stmt = connection.createStatement();
			String query = "select concerns, answers from CustomerService where answers <> 'TBA'";
			faqs = stmt.executeQuery(query);
		}catch(Exception e){
			e.printStackTrace();
			out.println("Error " + e.getMessage());
		}
	%>
	<table BORDER="1" id="table">
	<tr>
		<th>Questions</th>
		<th>Answers</th>
	<%
	while (faqs.next()) {
	%>
		<tr>
			<td><%=faqs.getString(1)%></td>
			<td><%=faqs.getString(2)%></td>
		</tr>
	<%
	}
	%>
	</table>
</body>
</html>