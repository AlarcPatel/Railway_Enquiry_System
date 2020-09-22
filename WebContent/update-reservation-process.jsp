<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://group18-336.cpfupltk9l6g.us-east-2.rds.amazonaws.com:3306/RAILWAY_REGISTRATION_FINAL2";%>
<%!String user = "Group18";%>
<%!String psw = "Rutgers2022";%>
<%
String res_id = request.getParameter("res_id");
String res_date = request.getParameter("res_date");
String transit_line_name = request.getParameter("transit_line_name");
String classname = request.getParameter("classname");
String total_fare = request.getParameter("total_fare");
String trip_type = request.getParameter("trip_type");	

if(res_id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(res_id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update Reservation set res_date=?,transit_line_name=?,classname=?,total_fare=?, trip_type=? Where res_id="+res_id;
ps = con.prepareStatement(sql);


ps.setString(1, res_date);
ps.setString(2, transit_line_name);
ps.setString(3, classname);
ps.setString(4, total_fare);
ps.setString(5, trip_type);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");

String redirectURL = "AddResProcess.jsp";
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


