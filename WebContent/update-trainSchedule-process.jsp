<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://group18-336.cpfupltk9l6g.us-east-2.rds.amazonaws.com:3306/RAILWAY_REGISTRATION_FINAL2";%>
<%!String user = "Group18";%>
<%!String psw = "Rutgers2022";%>
<%
String transit_line_name = request.getParameter("transit_line_name");
String trainId = request.getParameter("trainId");
String routeId = request.getParameter("routeId");
String station_arrival_time = request.getParameter("station_arrival_time");
String station_departure_time = request.getParameter("station_departure_time");
String stationId = request.getParameter("stationId");
String available_seats = request.getParameter("available_seats");	

if(trainId != null && station_arrival_time != null )
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(trainId);
int time = Integer.parseInt(station_arrival_time);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update Reservation set station_departure_time=?,available_seats=?Where trainId='"+trainId+"'AND station_arrival_time='"+station_arrival_time+"'" ;
ps = con.prepareStatement(sql);


ps.setString(1, station_departure_time);
ps.setString(2, available_seats);

int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");

String redirectURL = "ViewTrainSchedule.jsp";
response.sendRedirect(redirectURL);


}
else
{
out.print("There is a problem in updating Record.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>