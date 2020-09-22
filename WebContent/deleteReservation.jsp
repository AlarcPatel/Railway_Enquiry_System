 <!--Srushti Patel sap353-->

 

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
	
			String res_id = request.getParameter("res_id");
			
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://group18-336.cpfupltk9l6g.us-east-2.rds.amazonaws.com:3306/RAILWAY_REGISTRATION_FINAL2", "Group18","Rutgers2022");

			Statement stmt = con.createStatement();
			PreparedStatement ps = null;
			
				
		
			int i=stmt.executeUpdate("DELETE FROM Reservation WHERE res_id="+res_id);
			out.println("Data Deleted Successfully");
			String redirectURL = "AddResProcess.jsp";
			response.sendRedirect(redirectURL);
		
	}catch(Exception e){
		out.println("No such res_number exists");
		System.out.println(e);
	}
		
		%>
</body>
</html>