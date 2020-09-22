<!-- Dhwani shah - dvs48 -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%	
	
			
	    String username  = request.getParameter("username");
	

			
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
		    Connection conn = DriverManager.getConnection("jdbc:mysql://group18-336.cpfupltk9l6g.us-east-2.rds.amazonaws.com:3306/RAILWAY_REGISTRATION_FINAL2", "Group18","Rutgers2022");

			Statement stmt = conn.createStatement();
			PreparedStatement ps = null;
			int i=stmt.executeUpdate("DELETE FROM Customer WHERE username='"+username+"'");

				
		
			
			out.println("Data Deleted Successfully");
		
	}catch(Exception e){
		out.println("No such username exists");
		System.out.println(e);
	}
		
		%>
</body>
</html>