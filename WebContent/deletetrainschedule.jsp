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
	
	String trainId  = request.getParameter("trainId");
	    String station_departure_time  = request.getParameter("station_departure_time");
	

			
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://group18-336.cpfupltk9l6g.us-east-2.rds.amazonaws.com:3306/RAILWAY_REGISTRATION_FINAL2", "Group18","Rutgers2022");

			Statement stmt = con.createStatement();
			PreparedStatement ps = null;
			int i=stmt.executeUpdate("DELETE  FROM Train_Schedule WHERE station_departure_time='"+station_departure_time+"'");

			
			out.println("Data Deleted Successfully");
			String redirectURL = "ViewTrainSchedule.jsp";
			response.sendRedirect(redirectURL);
		
	}catch(Exception e){
		out.println("No such time exit exists");
		System.out.println(e);
	}
		
		%>
</body>
</html>