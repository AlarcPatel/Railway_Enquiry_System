<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="cs336LoginPage.*"%>
<%@ page
	import="java.io.*,java.util.*,java.sql.*,java.time.format.DateTimeFormatter,java.time.LocalDateTime, java.text.SimpleDateFormat, java.util.Date, java.util.Calendar, java.text.ParseException"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="styles/homepage.css">
<title>Train Reservation System</title>
</head>
<body>
<%
try{
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		boolean isUser = false;
		Statement stmt = con.createStatement();
		//Get the selected radio button from the index.jsp
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		String str = "SELECT * FROM Admin WHERE username = '"+ username +"' AND password = '"+ password +"'" ;
		ResultSet result = stmt.executeQuery(str);

		while(result.next()){
			out.print("<p>");
			isUser = true;
			out.print("WELCOME "+ result.getString("username"));
			 // take care of duplicates while entering
			 %>
			 <p> Hello </p>
			 <div class="navbar">
				 <a href="AddResProcess.jsp">Home</a>
				 <div class="dropdown">
					 <button class="dropbtn">Reservations
						 <i class="fa fa-caret-down"></i>
					 </button>
					 <div class="dropdown-content">
						 <a href="AddResform.html">Add Reservations</a>
						 <a href="AddResProcess.jsp">View Reservations</a>
						 <a href="AddResProcess.jsp">Update/Delete Reservations</a>
					 </div>
				 </div>
				<div class="dropdown">
					 <button class="dropbtn">Train Schedules
						 <i class="fa fa-caret-down"></i>
					 </button>
					 <div class="dropdown-content">
						 <a href="Addtrainform.html">Add Train Schedules</a>
						 <a href="ViewTrainSchedule.jsp">View Train Schedules</a>
						 <a href="editreservation.html">Update Train Schedules</a>
						 <a href="deletetrainschedule.html">Delete Train Schedules</a>
					 </div>
				 </div>
				 <div class="dropdown">
					 <button class="dropbtn">Search
						 <i class="fa fa-caret-down"></i>
					 </button>
					 <div class="dropdown-content">
						 <a href="listproduceorigin.html"> Train Schedule - By Origin/Destination</a>
						 <a href="listtrainschedule.html">Train Schedule - By Station</a>
						 <a href="Customerlist.html">Customer List</a>

					 </div>
				 </div>
				 <a href="CustomerQuestion.jsp">Customer Reply</a>
			 </div>
			 <%
		}
		if(isUser == false){
			out.print("Please enter valid username and password");
		}
		db.closeConnection(con);
}
catch (Exception e) {
	out.print("Hello" + e);
}
%>
</body>
</html>