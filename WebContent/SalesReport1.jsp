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
	   
	   // String transit_line_name = request.getParameter("transit_line_name");
	   // String firstName = request.getParameter("firstName");
	   // String lastName = request.getParameter("lastName");
		//String username = request.getParameter("username");
	 
	  
	   
	    String booking_fee = request.getParameter("booking_fee");
	%>
	<table border="1">
	<h3>
					list of sales report: 
					<%
				//out.print("transit_line_name: "+transit_line_name);
				//out.print("trainId: "+trainId);
				//out.print(" station_arrival_time: "+station_arrival_time);
				//out.print("station_departure_time: "+station_departure_time);
				//out.print("stationId : "+stationId);
				
				
	
			%>
				</h3>
		
		


		<%
			try {

				Class.forName("com.mysql.jdbc.Driver");
			    Connection con = DriverManager.getConnection("jdbc:mysql://group18-336.cpfupltk9l6g.us-east-2.rds.amazonaws.com:3306/RAILWAY_REGISTRATION_FINAL2", "Group18","Rutgers2022");


				Statement stmt = con.createStatement();
				
				PreparedStatement ps = null;

				ResultSet rs = 
                stmt.executeQuery("select sum(booking_fee) from Reservation");


				while (rs.next()) {
		%>
		<tr>
		
			<td><%=rs.getString(1)%></td>
			
		
			
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