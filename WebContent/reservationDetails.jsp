<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="cs336LoginPage.*"%>
<%@ page
	import="java.io.*,java.util.*,java.sql.*,java.time.format.DateTimeFormatter,java.time.LocalDateTime, java.text.SimpleDateFormat, java.util.Date, java.util.Calendar, java.text.ParseException"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th{
	background-color: #D9D9D9;
}
th, td {
  padding: 15px;
}
</style>
<meta charset="ISO-8859-1">
<title>Reservations</title>
<script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
</head>
<body>
	<%
		String username = request.getParameter("username");
		//String res_id = null;
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		PreparedStatement stmt = con.prepareStatement(
				"select res_id,username,res_date,trainId,transit_line_name,origin_datetime,dest_datetime,origin_stationId,destination_stationID,total_fare, trip_type from Reservation where username = ?");
		stmt.setString(1, username);
		ResultSet information = stmt.executeQuery();
		int count = 0;
	%>
	<p>All your reservation are stated below ...!!</p>
	<br>
	<br>
	<form method="post" action="cancelReservation.jsp">
	<table BORDER="1" id="table" style="width:100%">
		<tr>
			<th>Reservation ID</th>
			<th>User name</th>
			<th>Reservation Date</th>
			<th>Train ID</th>
			<th>Transit Line Name</th>
			<th>Origin Station Arrival</th>
			<th>Destination Station Arrival</th>
			<th>Origin Station</th>
			<th>Destination Station</th>
			<th>Fare</th>
			<th>Trip Type</th>
			<th>Cancel</th>
		</tr>
		<%
			String originStation = null;
			String destinationStation = null;
			while (information.next()) {
				try{
					PreparedStatement stmt1 = con.prepareStatement("select stationName from Station where stationId = ?");
					stmt1.setString(1, information.getString(8));
					ResultSet getOriginStation = stmt1.executeQuery();
					while(getOriginStation.next()){
						originStation = getOriginStation.getString(1);
					}
					stmt1.setString(1, information.getString(9));
					ResultSet getDestinationStation = stmt1.executeQuery();
					while(getDestinationStation.next()){
						destinationStation = getDestinationStation.getString(1);
					}	
				}catch (Exception e) {
					e.printStackTrace();
					out.println("Error " + e.getMessage());
				}
		%>
		<tr>
			<td><%=information.getString(1)%></td>
			<td><%=information.getString(2)%></td>
			<td><%=information.getString(3)%></td>
			<td><%=information.getString(4)%></td>
			<td><%=information.getString(5)%></td>
			<td><%=information.getString(6)%></td>
			<td><%=information.getString(7)%></td>
			<td><%=originStation%></td>
			<td><%=destinationStation%></td>
			<td><%=information.getString(10)%></td>
			<td><%=information.getString(11)%></td>
			<td><input type="radio" name="cancelBox" id="cancel_box"
							onclick="deleteRow(this)"></td>


		</tr>
		<%
				count++;
			}
		%>
	</table>
	<br>
	<br>
	<script>
		function deleteRow(r) {
			var i = r.parentNode.parentNode.rowIndex;
			var res_id = Number(document.getElementById("table").rows[i].cells[0].innerHTML);
			//alert(res_id);
			var setResId = document.getElementById("res_id");
			setResId.value = res_id;
			var setIndex = document.getElementById("index");
			setIndex.value = i;
		
		}
	</script>
		<input type="hidden" id="username" name="username"
			value="<%=username%>"> 
		<input type="hidden" id="password"
			name="password" value="<%=request.getParameter("password")%>">
		<input type="hidden" id="res_id" name="res_id">
		<input type="hidden" id="opt" name="click" value="<%= "Sign In" %>">
		<input type="hidden" id="index" name="index">
		<button type="submit" onclick="selectRadio()">Cancel</button>
		<script>
		function selectRadio() {
			//document.getElementById()
			document.getElementById("cancel_box").required = true;	
		}
		</script>
	</form>
	<br>
	<br>
	<form method="post" action="welcome.jsp">
		<input type="hidden" id="username" name="username"
			value="<%=username%>"> 
		<input type="hidden" id="password"
			name="password" value="<%=request.getParameter("password")%>">
		<input type="hidden" id="opt" name="click" value="<%= "Sign In" %>">
		<button type="submit">Home</button>
	</form>
</body>
</html>