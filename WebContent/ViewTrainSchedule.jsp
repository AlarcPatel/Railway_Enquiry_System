<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String transit_line_name = request.getParameter("transit_line_name");
String trainId = request.getParameter("trainId");
String routeId = request.getParameter("routeId");
String station_arrival_time = request.getParameter("station_arrival_time");
String station_departure_time = request.getParameter("station_departure_time");
String stationId = request.getParameter("stationId");
String available_seats = request.getParameter("available_seats");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://group18-336.cpfupltk9l6g.us-east-2.rds.amazonaws.com:3306/RAILWAY_REGISTRATION_FINAL2","Group18","Rutgers2022");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into Train_Schedule(transit_line_name,trainId,routeId,station_arrival_time,station_departure_time,stationId,available_seats)values('"+transit_line_name+"','"+trainId+"','"+routeId+"','"+station_arrival_time+"','"+station_departure_time+"','"+stationId+"','"+available_seats+"')");
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
<h1>View All Train Schedule</h1>
<table border="1">
<tr>
<td>transit_line_name </td>
<td>trainId</td>
<td>routeId</td>
<td>station_arrival_time</td>
<td>station_departure_time</td>
<td>stationId</td>
<td>available_seats</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from Train_Schedule";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("transit_line_name") %></td>
<td><%=resultSet.getString("trainId") %></td>
<td><%=resultSet.getString("routeId") %></td>
<td><%=resultSet.getString("station_arrival_time") %></td>
<td><%=resultSet.getString("station_departure_time") %></td>
<td><%=resultSet.getString("stationId") %></td>
<td><%=resultSet.getString("available_seats") %></td>
 
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