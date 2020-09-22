<!-- Dhwani shah - dvs48 -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String firstName = request.getParameter("firstName");
String lastName = request.getParameter("lastName");
String telephone = request.getParameter("telephone");
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String zipcode = request.getParameter("zipcode");
String email = request.getParameter("email");
String username = request.getParameter("username");
String password = request.getParameter("password");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://group18-336.cpfupltk9l6g.us-east-2.rds.amazonaws.com:3306/RAILWAY_REGISTRATION_FINAL2","Group18","Rutgers2022");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into Customer(firstName,lastName,telephone,address,city,state,zipcode,email,username,password)values('"+firstName+"','"+lastName+"','"+telephone+"','"+address+"','"+city+"','"+state+"','"+zipcode+"','"+email+"','"+username+"','"+password+"')");
out.println("Data is successfully inserted!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>