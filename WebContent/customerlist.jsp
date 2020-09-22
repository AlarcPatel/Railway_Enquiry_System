
<!--srushti Patel sap353-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer List</title>
<style>
table, td, th {  
  border: 1px solid #ddd;
  text-align: left;
}

table {
  border-collapse: collapse;
  width: 100%;
  table-layout: auto;
}

th,td {
  padding: 15px;
}
tr:nth-child(even) {background-color: #f2f2f2;}

tr:hover {background-color: #f5f5f5;}
</style>
</head>
<body>
	<%
	   
		String firstName = request.getParameter("firstName");
    	String lastName = request.getParameter("lastName");
	    String transit_line_name = request.getParameter("transit_line_name");
	    
	    
	     
	%>
	<table border="1">
	<h3>
					Seat Reserved for Customer on 
					<%
				
				out.print(" Transit Line: "+transit_line_name);
				
			%>
				</h3>
		
		<tr>
		<td>Transit Line Name</td>
		    <td>First Name</td>
		   <td>Last Name</td>
		    
			
			
		</tr>


		<%
			try {
				//String query = "select  distinct A.transit_line_name,B.res_date,C.firstName,C.lastName from Customer C , Reservation B,Train_Schedule A where  C.username= B.username and  A.transit_line_name=B.transit_line_name and B.transit_line_Name and A.transit_line_name like"
				Class.forName("com.mysql.jdbc.Driver");
			    Connection con = DriverManager.getConnection("jdbc:mysql://group18-336.cpfupltk9l6g.us-east-2.rds.amazonaws.com:3306/RAILWAY_REGISTRATION_FINAL2", "Group18","Rutgers2022");


				Statement stmt = con.createStatement();
				PreparedStatement ps = null;
				
				
			ResultSet rs = stmt.executeQuery("select distinct Customer.firstName, Customer.lastName, Reservation.transit_line_name from Customer inner join Reservation on Customer.username = Reservation.username inner join Train_Schedule on Reservation.transit_line_name='"+transit_line_name+"'");

				while (rs.next()) {
		%>
		<tr>
		
			<TD> <%= rs.getString(1) %> </TD>
               <TD> <%= rs.getString(2) %> </TD>
                <TD> <%= rs.getString(3) %> </TD>
			
			
              
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