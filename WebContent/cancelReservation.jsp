<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="cs336LoginPage.*"%>
<%@ page
	import="java.io.*,java.util.*,java.sql.*,java.time.format.DateTimeFormatter,java.time.LocalDateTime, java.text.SimpleDateFormat, java.util.Date, java.util.Calendar, java.text.ParseException"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
  background-color: powderblue;
}
button {
  background-color: #555555;
  color: white;
  border: 2px solid #555555;
  width: 25%;
  margin : 20px;
  padding : 10px 20px;
  cursor: pointer;
}
</style>
<meta charset="ISO-8859-1">
<title>Cancel Reservation</title>
</head>
<body>
<%
		String res_id = request.getParameter("res_id");
		try {
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
			
			PreparedStatement getInfo = con.prepareStatement("SELECT trainId, origin_datetime, dest_datetime from Reservation Where res_id = ?");
			getInfo.setInt(1, Integer.parseInt(res_id));
			
			ResultSet getInfo_result = getInfo.executeQuery();
			int trainId = 0;
			String origin_datetime="";
			String dest_datetime = "";
			
			while(getInfo_result.next()){
				trainId = Integer.parseInt(getInfo_result.getString("trainId"));
				origin_datetime = getInfo_result.getString("origin_datetime");
				dest_datetime = getInfo_result.getString("dest_datetime");
			}
			
			PreparedStatement updateTickets = con.prepareStatement(
					"update Train_Schedule t set available_seats = available_seats + 1 where trainId = ?  and station_arrival_time between ? and ?;");
					updateTickets.setInt(1,trainId);
					updateTickets.setString(2, origin_datetime);
					updateTickets.setString(3, dest_datetime);
					updateTickets.executeUpdate();
			
			PreparedStatement stmt = con.prepareStatement("DELETE FROM Reservation WHERE res_id = ?");
			stmt.setInt(1, Integer.parseInt(res_id));
			stmt.executeUpdate();
			//out.println("Your reservation is cancelled. (Reservation ID: " + res_id + ")");
		}catch(Exception e){
			e.printStackTrace();
			out.println("Error " + e.getMessage());
		}
%>
<form method="post" action="reservationDetails.jsp">
		<div style="padding-left:20px">
  		<h1>Your reservation is cancelled. (Reservation ID: "<%=res_id%>")</h1>
		</div>
		<input type="hidden" id="username" name="username"
			value="<%=request.getParameter("username")%>">
		<input type="hidden" id="password" name="password"
			value="<%=request.getParameter("password")%>">
		<input type="hidden" id="opt" name="click" value="<%= "Sign In" %>">
		<button type="submit">Back To Reservation List</button>
</form>
</body>
</html>