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
String redirectURL = "ViewTrainSchedule.jsp";
response.sendRedirect(redirectURL);
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>