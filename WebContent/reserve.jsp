<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="cs336LoginPage.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Ticket Reservation</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		var options = {
			minDate : "04/19/2020",
			maxDate : "04/26/2020",
			beforeShowDay : $.datepicker.weekends
		}
		$("#datepicker").datepicker(options);
	});
</script>
</head>
<style>
.middle {
	position: absolute;
	left: 22%;
}
</style>
<body>

	<h1>Ticket Reservation</h1>

	<p>Please select the origin and destination station from
		corresponding drop down list</p>
	<form method="post" action="trains.jsp">
		<div>
			<label for="stations_o">Choose origin station:</label> <select
				id="originStation" name="origin" required>
				<option value="">Select Origin</option>
				<%
					try {
						ApplicationDB db = new ApplicationDB();
						Connection con = db.getConnection();
						Statement stmt = con.createStatement();
						String query = "SELECT * FROM Station order by stationName asc";
						ResultSet stations = stmt.executeQuery(query);
						while (stations.next()) {
				%>
				<option value="<%=stations.getInt("stationId")%>"><%=stations.getString("stationName")%>
				</option>
				<%
					}
					} catch (Exception e) {
						e.printStackTrace();
						out.println("Error " + e.getMessage());
					}
				%>
			</select>
		</div>
		<br>
		<div>
			<label for="stations_d">Choose destination station:</label> <select
				id="destinationStation" name="dest" required>
				<option value="">Select Destination</option>
				<%
					try {
						ApplicationDB db = new ApplicationDB();
						Connection con = db.getConnection();
						Statement stmt = con.createStatement();
						String query = "SELECT * FROM Station order by stationName asc";
						ResultSet stations = stmt.executeQuery(query);
						while (stations.next()) {
				%>
				<option value="<%=stations.getInt("stationId")%>"><%=stations.getString("stationName")%>
				</option>
				<%
					}
					} catch (Exception e) {
						e.printStackTrace();
						out.println("Error " + e.getMessage());
					}
				%>
			</select> 
			<br> <br> 
			<label for="datepicker">Travel date:</label> 
			<input type="text" name="selDate" id="datepicker" required> 
			<br>
			<br> 
			<label for="discount">Are you a children (below
				18), a senior (65 or above) or disabled? (Select yes if one or more
				apply to get 5% discount)</label> 
			<br> Yes <input type="radio"
				name="discount" id="discount1" value="yes"> No <input
				type="radio" name="discount" id="discount1" value="no"> <br>
			<br> 
			<label for="ticketType"> Select the type of ticket
				you want: </label> <br> One-Way <input type="radio" name="type"
				id="type" value="one_way"> Round Trip <input type="radio"
				name="type" id="type" value="two_way"> Weekly Pass <input
				type="radio" name="type" id="type" value="weekly"> Monthly
			Pass <input type="radio" name="type" id="type" value="monthly">
			<br> <br> 
			<label for="class"> Select travel class:
			</label> <br> Economy (Fare) <input type="radio" name="class_type"
				id="class" value="economy"> Business (Fare + $10) <input
				type="radio" name="class_type" id="class" value="business">
			First Class (Fare + $15) <input type="radio" name="class_type"
				id="class" value="first_class"> <br> <br>
			<div class="middle">
				<input type="hidden" id="username" name="username"
					value="<%=request.getParameter("username")%>"> <input
					type="hidden" id="password" name="password"
					value="<%=request.getParameter("password")%>"> 
				<input type="hidden" id="opt" name="click" value="<%= "Sign In" %>">
					<input type="submit" value="Search" onclick="selectRadio()">
			</div>
		</div>
	</form>
	<form method="post" action="welcome.jsp">
		<input type="hidden" id="username" name="username"
			value="<%=request.getParameter("username")%>"> 
		<input type="hidden" id="password"
			name="password" value="<%=request.getParameter("password")%>">
		<input type="hidden" id="opt" name="click" value="<%= "Sign In" %>">
		<button type="submit">Home</button>
	</form>
	<script>
		function selectRadio() {
			//document.getElementById()
			//alert("Please select different origin and destionation stations!!!");
			var e = document.getElementById("originStation");
			var origin = e.options[e.selectedIndex].text;
			var e1 = document.getElementById("destinationStation");
			var dest = e1.options[e1.selectedIndex].text;
			if(origin == dest){
				alert("Please select different origin and destionation stations!!!");
				e1.value = "";
			}
			document.getElementById("discount1").required = true;
			document.getElementById("type").required = true;
			document.getElementById("class").required = true;
			//document.getElementById("demo").innerHTML = "The required property was set. The radio button must now be checked before submitting the form.";
		}
	</script>
</body>
</html>