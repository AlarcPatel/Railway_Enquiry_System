
<!--srushti Patel sap353-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Train reservation System</title>
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
	    String trainId = request.getParameter("transit_line_name");
	    String transit_line_name = request.getParameter("trainId");
	    String station_arrival_time = request.getParameter("station_arrival_time");
	    String station_departure_time = request.getParameter("station_departure_time");
		String stationId = request.getParameter("stationId");
	    String stationName = request.getParameter("stationName");
	   
	    
	%>
	<table border="1">
	<h3>
					list of train schedules for 
					<%
				out.print(" Station ID : "+stationId);
			%>
				</h3>
		
		<tr>
		    <td>transit_line_name</td>
		    <td>trainId</td>
		    <td>station_arrival_time</td>
	         <td>station_departure_time</td>
		    <td>stationId</td>
			
			
		</tr>


		<%
			try {

				Class.forName("com.mysql.jdbc.Driver");
			    Connection con = DriverManager.getConnection("jdbc:mysql://group18-336.cpfupltk9l6g.us-east-2.rds.amazonaws.com:3306/RAILWAY_REGISTRATION_FINAL2", "Group18","Rutgers2022");


				Statement stmt = con.createStatement();
				//PreparedStatement ps = null;

				ResultSet rs = 
                stmt.executeQuery("select Train_Schedule.transit_line_name,Train_Schedule.trainId,Train_Schedule.station_arrival_time,Train_Schedule.station_departure_time,Station.stationId from Station join Train_Schedule on Station.stationId='"+stationId+"'");
				

				while (rs.next()) {
		%>
		<tr>
		
			<td><%=rs.getString(1)%></td>
			<TD> <%= rs.getString(2) %> </TD>
			<TD> <%= rs.getString(3) %> </TD>
               <TD> <%= rs.getString(4) %> </TD>
              <TD> <%= rs.getString(5) %> </TD>
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