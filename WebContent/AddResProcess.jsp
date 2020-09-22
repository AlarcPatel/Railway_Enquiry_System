<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String res_id = request.getParameter("res_id");
String username = request.getParameter("username");
String res_date = request.getParameter("res_date");
String trainId = request.getParameter("trainId");
String transit_line_name = request.getParameter("transit_line_name");
String origin_datetime = request.getParameter("origin_datetime");
String dest_datetime = request.getParameter("dest_datetime");
String origin_stationId = request.getParameter("origin_stationId");
String destination_stationID = request.getParameter("destination_stationID");
String classname = request.getParameter("classname");
String total_fare = request.getParameter("total_fare");
String booking_fee = request.getParameter("booking_fee");
String trip_type = request.getParameter("trip_type");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://group18-336.cpfupltk9l6g.us-east-2.rds.amazonaws.com:3306/RAILWAY_REGISTRATION_FINAL2","Group18","Rutgers2022");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into Reservation(res_id,username,res_date,trainId,transit_line_name,origin_datetime,dest_datetime,origin_stationId,destination_stationID,classname,total_fare,booking_fee,trip_type)values('"+res_id+"','"+username+"','"+res_date+"','"+trainId+"','"+transit_line_name+"','"+origin_datetime+"','"+dest_datetime+"','"+origin_stationId+"','"+destination_stationID+"','"+classname+"','"+total_fare+"','"+booking_fee+"','"+trip_type+"')");
out.println("Data is successfully inserted!");

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>

<%

String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://group18-336.cpfupltk9l6g.us-east-2.rds.amazonaws.com:3306";
String database = "/RAILWAY_REGISTRATION_FINAL2";
String userid = "Group18";
String password = "Rutgers2022";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<html>
<head>
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
<link href="styles/homepage.css" rel="stylesheet" type="text/css">
<body>
<jsp:include page="UI2.jsp"/>
<h1>View All Reservation</h1>
<table border="1">
<tr>
<td>Reservation ID</td>
<td>Username</td>
<td>Reservation Date</td>
<td>Train ID</td>
<td>Transit Line Name</td>
<td>Origin Schedule</td>
<td>Destination Schedule</td>
<td>Origin Station ID</td>
<td>Destination Station ID</td>
<td>Class</td>
<td>Total Fare</td>
<td>Booking Fee</td>
<td>Trip Type</td>
<td>Action</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from Reservation";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("res_id") %></td>
<td><%=resultSet.getString("username") %></td>
<td><%=resultSet.getString("res_date") %></td>
<td><%=resultSet.getString("trainId") %></td>
<td><%=resultSet.getString("transit_line_name") %></td>
<td><%=resultSet.getString("origin_datetime") %></td>
<td><%=resultSet.getString("dest_datetime") %></td>
<td><%=resultSet.getString("origin_stationId") %></td>
<td><%=resultSet.getString("destination_stationID") %></td>
<td><%=resultSet.getString("classname") %></td>
<td><%=resultSet.getString("total_fare") %></td>
<td><%=resultSet.getString("booking_fee") %></td>
<td><%=resultSet.getString("trip_type") %></td>
<td><a href="updateReservation.jsp?res_id=<%=resultSet.getString("res_id")%>">Update</a>
<a href="deleteReservation.jsp?res_id=<%=resultSet.getString("res_id")%>">Delete</a></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>