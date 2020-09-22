<!-- Dhwani shah - dvs48 -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Train reservation System</title>
</head>
<body>
	<%
	   
	  
	  
	    String destination_stationID = request.getParameter("destination_stationID");
	    String  stationName = request.getParameter("stationName");
	    String revenue = request.getParameter("revenue");
	%>
	<table border="1">
	<h3>
					list of revenues for destination city:
					<%
				
				
	
			%>
				</h3>
		
		


		<%
			try {

				Class.forName("com.mysql.jdbc.Driver");
			    Connection conn = DriverManager.getConnection("jdbc:mysql://group18-336.cpfupltk9l6g.us-east-2.rds.amazonaws.com:3306/RAILWAY_REGISTRATION_FINAL2", "Group18","Rutgers2022");


				Statement stmt = conn.createStatement();
				
				PreparedStatement ps = null;

				ResultSet rs = 
                stmt.executeQuery("select r.destination_stationID, s.stationName,count(*)revenue from Reservation r,Station s where r.destination_stationID=s.stationId group by r.destination_stationID order by revenue desc");


				while (rs.next()) {
		%>
		<tr>
		
			
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
		
			
		</tr>

		<%
			}
				
		%>
	</table>
	<%
		} catch (Exception e) {

			System.out.println(e);
		}
	%>

</body>
</html>