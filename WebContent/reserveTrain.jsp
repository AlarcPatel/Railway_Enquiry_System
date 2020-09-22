<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="cs336LoginPage.*"%>
<%@ page
	import="java.io.*,java.util.*,java.sql.*,java.time.format.DateTimeFormatter,java.time.LocalDateTime, java.text.SimpleDateFormat, java.util.Date, java.util.Calendar, java.text.ParseException"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reserve Train</title>
<script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
</head>
<body>
	<%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String train_id = request.getParameter("train_id");
		String transit_line_name = request.getParameter("transit_line_name");
		String origin_id = request.getParameter("origin_id");
		String dest_id = request.getParameter("dest_id");
		String arrivalTime = request.getParameter("arrival_time");
		String destTime = request.getParameter("dest_time");
		String dest_arrival_time = request.getParameter("final_dest_arrival");
		String trip_type = request.getParameter("trip_type");
		String class_type = request.getParameter("class_type");
		String fareAmount = request.getParameter("fare");
		String origin_name = request.getParameter("origin_name");
		String dest_name = request.getParameter("dest_name");
		String res_id = "";
		boolean NO_SEAT_AVAILABLE =false;

			try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();


		PreparedStatement checkAvailable =con.prepareStatement(
				"select available_seats from Train_Schedule where trainId = ? and transit_line_name = ? and station_arrival_time between ? and ?");
		checkAvailable.setInt(1,Integer.parseInt(train_id));
		checkAvailable.setString(2, transit_line_name);
		checkAvailable.setString(3,arrivalTime);
		checkAvailable.setString(4,dest_arrival_time);
		ResultSet checkAvailable_result = checkAvailable.executeQuery();

		while(checkAvailable_result.next()){
			if(Integer.parseInt(checkAvailable_result.getString(1)) <= 0){
				NO_SEAT_AVAILABLE = true;
			}
		}

			if (NO_SEAT_AVAILABLE) {
	%>
	<h6 style="color: green;">Sorry! We are not able to reserve any
		seat for you because all the seats are reserved.</h6>
	<form method="post" action="reserve.jsp">
		<input type="hidden" id="username" name="username"
			value="<%=username%>"> <input type="hidden" id="password"
			name="password" value="<%=password%>"> <input type="hidden"
			id="opt" name="click" value="<%="Sign In"%>">
		<button type="submit">Back To Ticket Reservation</button>
	</form>
	<%
		} else {
			try{
				PreparedStatement updateTickets = con.prepareStatement(
						"update Train_Schedule t set available_seats = available_seats - 1 where trainId = ?  and station_arrival_time between ? and ?;");
				updateTickets.setInt(1, Integer.parseInt(train_id));
				updateTickets.setString(2, arrivalTime);
				updateTickets.setString(3, dest_arrival_time);
				updateTickets.executeUpdate();

				PreparedStatement stmt = con.prepareStatement(
						"INSERT INTO Reservation( username, res_date, trainId, transit_line_name, origin_datetime, dest_datetime, origin_stationId, destination_stationID, classname, total_fare, trip_type) VALUES (?, ?, ?,?, ?, ?, ?, ?, ?, ?, ?)");
				stmt.setString(1, username);

				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
				LocalDateTime now = LocalDateTime.now();
				String res_date = dtf.format(now);
				stmt.setString(2, res_date);

				stmt.setInt(3, Integer.parseInt(train_id));
				stmt.setString(4, transit_line_name);
				stmt.setString(5, arrivalTime);
				stmt.setString(6, dest_arrival_time);
				stmt.setInt(7, Integer.parseInt(origin_id));
				stmt.setInt(8, Integer.parseInt(dest_id));
				stmt.setString(9, class_type);
				stmt.setDouble(10, Double.parseDouble(fareAmount));
				stmt.setString(11, trip_type);
				stmt.executeUpdate();
				Statement getMaxResId = con.createStatement();
				String query = "select max(res_id) from Reservation";
				ResultSet getMax = getMaxResId.executeQuery(query);
				while(getMax.next()){
					res_id = getMax.getString(1);
				}
				//res_id = "" + (Integer.parseInt(res_id) + 1);
			}catch (Exception e) {
				e.printStackTrace();
				out.println("Error " + e.getMessage());
			}
	%>
	<h6>Your reservation has been made!!! Here is the information
		about your reservation:</h6>
	<br>
	<p>
		User name :
		<%=username%>
	</p>
	<p>
		Reservation ID :
		<%=res_id%>
	</p>
	<p>
		Train ID :
		<%=train_id%>
	</p>
	<p>
		Transit Line name :
		<%=transit_line_name%>
	</p>
	<p>
		Origin Station :
		<%=origin_name%>
	</p>
	<p>
		Destination Station :
		<%=dest_name%>
	</p>
	<p>
		Arrival Time :
		<%=arrivalTime%>
	</p>
	<p>
		Departure time :
		<%=destTime%>
	</p>
	<p>
		Destination Station Arrival Time :
		<%=dest_arrival_time%>
	</p>
	<p>
		Class Type :
		<%=class_type%>
	</p>
	<p>
		Trip Type :
		<%=trip_type%>
	</p>
	<p>
		Total amount :
		<%=fareAmount%>
		+ Booking fee ($3)
	</p>

	<%
		}
		} catch (Exception e) {
			e.printStackTrace();
			out.println("Error " + e.getMessage());
		}
	%>

	<form method="post" action="welcome.jsp">
		<input type="hidden" id="username" name="username"
			value="<%=username%>"> <input type="hidden" id="password"
			name="password" value="<%= password %>"> <input type="hidden"
			id="opt" name="click" value="<%= "Sign In" %>">
		<button type="submit">Home</button>
	</form>

</body>
</html>
