<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String unique_id = request.getParameter("unique_id");
String res_id = request.getParameter("res_id");
String username = request.getParameter("username");
String employee_ssn= request.getParameter("employee_ssn");
String title = request.getParameter("title");
String concers = request.getParameter("concerns");
String answers = request.getParameter("answers");
String keyword = request.getParameter("keyword");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://group18-336.cpfupltk9l6g.us-east-2.rds.amazonaws.com:3306/RAILWAY_REGISTRATION_FINAL2","Group18","Rutgers2022");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into Customer(unique_id,res_id,username,employee_ssn,title,concerns,answers,keyword)values('"+unique_id+"','"+res_id+"','"+username+"','"+employee_ssn+"','"+title+"','"+concers+"','"+answers+"','"+keyword+"')");
out.println("Data is successfully inserted!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>