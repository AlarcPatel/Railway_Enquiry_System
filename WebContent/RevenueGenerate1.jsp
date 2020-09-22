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
	   
	    String transit_line_name = request.getParameter("transit_line_name");
	 String revenue = request.getParameter("revenue");

	%>
	<table border="1">
	<h3>
					list of revenues for transit line:
					<%
				
				
	
			%>
				</h3>
		
		


		<%
			try {

				Class.forName("com.mysql.jdbc.Driver");
			    Connection con = DriverManager.getConnection("jdbc:mysql://group18-336.cpfupltk9l6g.us-east-2.rds.amazonaws.com:3306/RAILWAY_REGISTRATION_FINAL2", "Group18","Rutgers2022");


				Statement stmt1 = con.createStatement();
				Statement stmt2 = con.createStatement();
				Statement stmt3 = con.createStatement();
				PreparedStatement ps = null;

				ResultSet rs = 
                stmt1.executeQuery("select r.transit_line_name, count(*)revenue from Reservation r group by r.transit_line_name order by revenue desc");
				
				while (rs.next()) {
		%>
		<tr>
		
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			
			
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