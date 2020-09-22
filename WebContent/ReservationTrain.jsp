<!--dhwani shah dvs48-->

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
    	String trainId = request.getParameter("trainId");
	    String transit_line_name = request.getParameter("transit_line_name");
	    
	    
	     
	%>
	<table border="1">
	<h3>
					list of reservation using train number and transit line name: 
					<%
				
				
				
				
	
			%>
				</h3>
		
		<tr>
		<td>firstName</td>
		   <td>lastName</td>
		   <td>transit_line_name</td>
		   <td>trainId</td>
		    
			
			
		</tr>


		<%
			try {
				
				Class.forName("com.mysql.jdbc.Driver");
			    Connection conn = DriverManager.getConnection("jdbc:mysql://group18-336.cpfupltk9l6g.us-east-2.rds.amazonaws.com:3306/RAILWAY_REGISTRATION_FINAL2", "Group18","Rutgers2022");


				Statement stmt = conn.createStatement();
				PreparedStatement ps = null;
				
				
			ResultSet rs = stmt.executeQuery("select distinct Customer.firstName, Customer.lastName, Reservation.transit_line_name,Reservation.trainId from Reservation join Customer on Customer.username=Reservation.username where Reservation.trainId='"+trainId+"'");

				while (rs.next()) {
		%>
		<tr>
		
			<TD> <%= rs.getString(1) %> </TD>
               <TD> <%= rs.getString(2) %> </TD>
                <TD> <%= rs.getString(3) %> </TD>
                 <TD> <%= rs.getString(4) %> </TD>
			
			
			
              
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