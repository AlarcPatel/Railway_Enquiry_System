<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="cs336LoginPage.*"%>
<%@ page
	import="java.io.*,java.util.*,java.sql.*,java.time.format.DateTimeFormatter,java.time.LocalDateTime, java.text.SimpleDateFormat, java.util.Date, java.util.Calendar, java.text.ParseException"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADMIN LOGIN</title>
</head>
<body>
<%
try{
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		boolean isUser = false;
		Statement stmt = con.createStatement();
		//Get the selected radio button from the index.jsp
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		String str = "SELECT * FROM Admin WHERE Username = '"+ username +"' AND Password = '"+ password +"'" ;
		ResultSet result = stmt.executeQuery(str);

		while(result.next()){
			out.print("<p>");
			isUser = true;
			out.print("WELCOME "+ result.getString("username")); // take care of duplicates while entering
			String redirectUrl = "http://localhost:8080/LoginPage_Group18/adminHome.jsp";
			response.sendRedirect(redirectUrl);
		}
		if(isUser == false){
			out.print("Please enter valid username and password");
		}
		db.closeConnection(con);
}
catch (Exception e) {
	out.print("Hello" + e);
}
%>
</body>
</html>
