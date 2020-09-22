<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String unique_id = request.getParameter("unique_id");
String res_id = request.getParameter("res_id");
String username = request.getParameter("username");
String employee_ssn = request.getParameter("employee_ssn");
String title = request.getParameter("title");
String concerns = request.getParameter("concerns");
String answers = request.getParameter("answers");
String email = request.getParameter("email");
String firstName = request.getParameter("firstName");

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
<td>Unique ID </td>
<td>Reservation Number</td>
<td>Username</td>
<td>Employee SSN</td>
<td>Title</td>
<td>Concerns</td>
<td>Answers</td>
<td>Email</td>
<td>First Name</td>
<td>Action</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from CustomerService";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("unique_id") %></td>
<td><%=resultSet.getString("res_id") %></td>
<td><%=resultSet.getString("username") %></td>
<td><%=resultSet.getString("employee_ssn") %></td>
<td><%=resultSet.getString("title") %></td>
<td><%=resultSet.getString("concerns") %></td>
<td><%=resultSet.getString("answers") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("firstName") %></td>
<td><a href="CustomerReplyProcess.jsp?unique_id=<%=resultSet.getString("unique_id")%>">Reply</a>
 
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