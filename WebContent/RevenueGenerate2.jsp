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
	   
	  
	    String firstName = request.getParameter("firstName");
	    String lastName = request.getParameter("lastName");
		String revenue = request.getParameter("revenue");
	    
	%>
	<table border="1">
	<h3>
					list of revenues for Customer name:
					<%
				
				
	
			%>
				</h3>
		
		


		<%
			try {

				Class.forName("com.mysql.jdbc.Driver");
			    Connection con = DriverManager.getConnection("jdbc:mysql://group18-336.cpfupltk9l6g.us-east-2.rds.amazonaws.com:3306/RAILWAY_REGISTRATION_FINAL2", "Group18","Rutgers2022");


				
				Statement stmt2 = con.createStatement();
				
				PreparedStatement ps = null;

				ResultSet rs = 
                
				stmt2.executeQuery("select c.firstName, c.lastName,count(*)revenue from Reservation r , Customer c where r.username=c.username group by r.username order by revenue desc");
                
				while (rs.next()) {
		%>
		<tr>
		
			<td><%=rs.getString(1)%></td>
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