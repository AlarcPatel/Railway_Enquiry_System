<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="cs336LoginPage.*"%>
<%@ page
	import="java.io.*,java.util.*,java.sql.*, java.text.SimpleDateFormat, java.util.Date, java.util.Calendar, java.text.ParseException"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
   margin: 20px 2px;
}
th{
	background-color: #D9D9D9;
}
th, td {
  padding: 15px;
}
button {
  background-color: white;
  color: black;
  border: 2px solid #555555;
}

button:hover {
  background-color: #555555;
  color: white;
}
</style>
<meta charset="ISO-8859-1">
<title>List of Trains</title>
<script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
</head>
<style>
.middle {
	position: absolute;
	left: 22%;
}
</style>
<body>
		<div>
			<%
			String origin = request.getParameter("origin");
			String dest = request.getParameter("dest");
			String type = request.getParameter("type");
			String date = request.getParameter("selDate");
			String discount = request.getParameter("discount");
			String class_type = request.getParameter("class_type");
			String username = request.getParameter("username");
			//out.println(username);
			Date dateF = new SimpleDateFormat("MM/dd/yyyy").parse(date);
			//out.println(hel + " " + cfad);
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			String travelDate = formatter.format(dateF);
			Calendar c = Calendar.getInstance();
			try {
				c.setTime(formatter.parse(travelDate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			c.add(Calendar.DAY_OF_MONTH, 1);
			travelDate += " 00:00:00";
			type = type + "_fare";
			String travelPlus = formatter.format(c.getTime()) + " 00:00:00";
			String trainId = null;
			String transitLine = null;
			String arrivalTime = null;
			String departureTime = null;
			String routeId = null;
			ArrayList<String> origin_station_train_schedule = new ArrayList<String>();
			ArrayList<String> destination_station_train_schedule = new ArrayList<String>();
			ArrayList<String> one_way_fare = new ArrayList<String>();
			ArrayList<String> two_way_fare = new ArrayList<String>();
			ArrayList<String> weekly_fare = new ArrayList<String>();
			ArrayList<String> monthly_fare = new ArrayList<String>();
			ArrayList<String> number_of_stops = new ArrayList<String>();
			ArrayList<String> dest_arrival_time = new ArrayList<String>();
			ArrayList<ArrayList<String>> listStops = new ArrayList<ArrayList<String>>();
			if (origin.equals(dest)) {
				out.println("Origin and Destination stations cannot be the same!");
				throw new Exception();
			}
			String originStation = null;
			String destStation = null;
			ResultSet available_trains = null;
			int count_available = 0;
			try {
				ApplicationDB db = new ApplicationDB();
				Connection con = db.getConnection();
				PreparedStatement stmt = con.prepareStatement("SELECT * FROM Station where stationId = ?");
				stmt.setInt(1, Integer.parseInt(origin));
				ResultSet stations = stmt.executeQuery();
				while (stations.next()) {
					originStation = stations.getString("stationName");
				}
				stmt.setInt(1, Integer.parseInt(dest));
				stations = stmt.executeQuery();
				while (stations.next()) {
					destStation = stations.getString("stationName");
				}
				PreparedStatement tableTrain = con.prepareStatement(
						"select trainId, transit_line_name, station_arrival_time, station_departure_time, t.routeId, one_way_fare, two_way_fare, weekly_fare, monthly_fare, number_of_stops, r.stationId_origin, r.stationId_destination from Train_Schedule t, Route r where stationId = ? and t.routeId = r.routeId and t.trainId in (select trainId from Train_Schedule where stationId = ? and t.station_arrival_time < station_arrival_time and station_arrival_time >= ? and station_arrival_time < ? and t.routeId = routeId) and station_arrival_time in (select station_arrival_time from Train_Schedule where station_arrival_time >= ? and station_arrival_time < ? and t.routeId = routeId and t.trainId = trainId)");	tableTrain.setInt(1, Integer.parseInt(origin));
				tableTrain.setInt(1,Integer.parseInt(origin));
				tableTrain.setInt(2, Integer.parseInt(dest));
				tableTrain.setString(3, travelDate);
				tableTrain.setString(4, travelPlus);
				tableTrain.setString(5, travelDate);
				tableTrain.setString(6, travelPlus);
				//table_available_trains = tableTrain.executeQuery();

				available_trains = tableTrain.executeQuery();

				PreparedStatement stops = con.prepareStatement(
				"select stationName from Station where stationId in (select stationId from Train_Schedule where trainId = ? and routeId = ? and station_arrival_time >= ? and station_arrival_time <= ?)");

				int count = 0;
				while (available_trains.next()) {
					//out.println(stops.toString());
					trainId = available_trains.getString(1);
					transitLine = available_trains.getString(2);
					arrivalTime = available_trains.getString(3);
					departureTime = available_trains.getString(4);
					routeId = available_trains.getString(5);
					one_way_fare.add(available_trains.getString(6));
					two_way_fare.add(available_trains.getString(7));
					weekly_fare.add(available_trains.getString(8));
					monthly_fare.add(available_trains.getString(9));
					number_of_stops.add(available_trains.getString(10));
					PreparedStatement dest_time = con.prepareStatement(
					"select station_arrival_time from Train_Schedule where trainId = ? and routeId = ? and stationId = ? and station_arrival_time >= ? and station_arrival_time <=?");
					dest_time.setInt(1, Integer.parseInt(trainId));
					dest_time.setInt(2, Integer.parseInt(routeId));
					dest_time.setInt(3, Integer.parseInt(dest));
					dest_time.setString(4, travelDate);
					dest_time.setString(5, travelPlus);
					ResultSet getTime = dest_time.executeQuery();
					while (getTime.next()) {
						dest_arrival_time.add(getTime.getString(1));
					}
					stops.setInt(1, Integer.parseInt(trainId));
					stops.setInt(2, Integer.parseInt(routeId));
					stops.setString(3, arrivalTime);
					stops.setString(4, dest_arrival_time.get(count));
					count++;
					//out.println(departureTime);

					// adding Train schedule origin and destination inside an arraylist
					stmt.setInt(1,Integer.parseInt(available_trains.getString(11)));
					ResultSet origin_station = stmt.executeQuery();
					while (origin_station.next()) {
					origin_station_train_schedule.add(origin_station.getString("stationName"));
				}
					stmt.setInt(1,Integer.parseInt(available_trains.getString(12)));
					ResultSet destionation_station = stmt.executeQuery();
					while (destionation_station.next()) {
						destination_station_train_schedule.add(destionation_station.getString("stationName"));
					}

					ResultSet stopsList = stops.executeQuery();
					//int count = 0;
					ArrayList<String> list = new ArrayList<String>();
					while (stopsList.next()) {
				//count++;
				list.add(stopsList.getString("stationName"));
					}
					listStops.add(list);
					//out.println(count); <td> <%= listStops.toString() </td>
				}
				/*
				while(available_trains.next()){
				out.println(available_trains.getString(1));
				out.println(available_trains.getString(2));
				out.println(available_trains.getString(3));
				out.println(available_trains.getString(4));
				}
				*/
				available_trains = tableTrain.executeQuery();

			} catch (Exception e) {
				e.printStackTrace();
				out.println("Error " + e.getMessage());
			}
			%>

			<p>
				Origin Station:
				<%
				out.println(originStation);
			%>
			</p>

			<p>
				Destination Station:
				<%
				out.println(destStation);
			%>
			</p>

			<h4>Train(s) Available from the Origin Station to the
				Destination Station:</h4>
			<div>

				<p>Click the button to sort the table :</p>
				<div class = "spbutton">
				
					<button onclick="sortOriginArrival()">Sort by arrival time</button>
				
				
					<button onclick="sortOriginDeparture()">Sort by departure
						time</button>
				
				
					<button onclick="sortDestinationArrival()">Sort by destination arrival time</button>
				
				
					<button onclick="sortFare()">Sort by Fare</button>
				
					<button onclick="sortOrigin()">Sort by Origin</button>
				
					<button onclick="sortDestination()">Sort by Destination</button>
				
				</div>
			</div>
			<form method="post" action="reserveTrain.jsp">
			<div>
				<script>
					//need to make change in the inequaltity sign for origin arrival....!!
					function sortOriginArrival() {
						var table, rows, switching, i, x, y, shouldSwitch;
						table = document.getElementById("table");
						switching = true;
						while (switching) {
							//start by saying: no switching is done:
							switching = false;
							rows = table.rows;
							for (i = 1; i < (rows.length - 1); i++) {
								shouldSwitch = false;
								x = rows[i].getElementsByTagName("TD")[5];
								y = rows[i + 1].getElementsByTagName("TD")[5];
								if (x.innerHTML > y.innerHTML) {
									shouldSwitch = true;
									if (shouldSwitch) {
										rows[i].parentNode.insertBefore(
												rows[i + 1], rows[i]);
										switching = true;
									}
									break;
								}
							}
						}
					}

					function sortDestinationArrival() {
						var table, rows, switching, i, x, y, shouldSwitch;
						table = document.getElementById("table");
						switching = true;
						while (switching) {
							//start by saying: no switching is done:
							switching = false;
							rows = table.rows;
							for (i = 1; i < (rows.length - 1); i++) {
								shouldSwitch = false;
								x = rows[i].getElementsByTagName("TD")[7];
								y = rows[i + 1].getElementsByTagName("TD")[7];
								if (x.innerHTML > y.innerHTML) {
									shouldSwitch = true;
									if (shouldSwitch) {
										rows[i].parentNode.insertBefore(
												rows[i + 1], rows[i]);
										switching = true;
									}
									break;
								}
							}
						}
					}

					function sortOriginDeparture() {
						var table, rows, switching, i, x, y, shouldSwitch;
						table = document.getElementById("table");
						switching = true;

						while (switching) {
							switching = false;
							rows = table.rows;
							for (i = 1; i < (rows.length - 1); i++) {
								shouldSwitch = false;
								x = rows[i].getElementsByTagName("TD")[6];
								y = rows[i + 1].getElementsByTagName("TD")[6];
								if (x.innerHTML > y.innerHTML) {
									shouldSwitch = true;
									if (shouldSwitch) {
										rows[i].parentNode.insertBefore(
												rows[i + 1], rows[i]);
										switching = true;
									}
									break;
								}
							}
						}
					}

					function sortFare() {
						var table, rows, switching, i, x, y, shouldSwitch;
						table = document.getElementById("table");
						switching = true;

						while (switching) {
							switching = false;
							rows = table.rows;
							for (i = 1; i < (rows.length - 1); i++) {
								shouldSwitch = false;
								x = rows[i].getElementsByTagName("TD")[10];
								y = rows[i + 1].getElementsByTagName("TD")[10];
								if (Number(x.innerHTML) > Number(y.innerHTML)) {
									shouldSwitch = true;
									if (shouldSwitch) {
										rows[i].parentNode.insertBefore(
												rows[i + 1], rows[i]);
										switching = true;
									}
									break;
								}
							}
						}
					}
						function sortOrigin() {
							var table, rows, switching, i, x, y, shouldSwitch;
							table = document.getElementById("table");
							switching = true;

							while (switching) {
								switching = false;
								rows = table.rows;
								for (i = 1; i < (rows.length - 1); i++) {
									shouldSwitch = false;
									x = rows[i].getElementsByTagName("TD")[3];
									y = rows[i + 1].getElementsByTagName("TD")[3];
									if (x.innerHTML > y.innerHTML) {
										shouldSwitch = true;
										if (shouldSwitch) {
											rows[i].parentNode.insertBefore(
													rows[i + 1], rows[i]);
											switching = true;
										}
										break;
									}
								}
							}
						}
						function sortDestination() {
							var table, rows, switching, i, x, y, shouldSwitch;
							table = document.getElementById("table");
							switching = true;

							while (switching) {
								switching = false;
								rows = table.rows;
								for (i = 1; i < (rows.length - 1); i++) {
									shouldSwitch = false;
									x = rows[i].getElementsByTagName("TD")[4];
									y = rows[i + 1].getElementsByTagName("TD")[4];
									if (x.innerHTML > y.innerHTML) {
										shouldSwitch = true;
										if (shouldSwitch) {
											rows[i].parentNode.insertBefore(
													rows[i + 1], rows[i]);
											switching = true;
										}
										break;
									}
								}
							}
						}

				</script>


				<%!public double GetFare(int count, String type, ArrayList<String> one_way_fare, ArrayList<String> two_way_fare,
			ArrayList<String> weekly_fare, ArrayList<String> monthly_fare, ArrayList<String> number_of_stops,
			ArrayList<ArrayList<String>> listStops) {

		double ans = 0;
		if (type.equals("one_way_fare")) {
			ans = Double.parseDouble(one_way_fare.get(count)) * listStops.get(count).size()
					/ (Double.parseDouble(number_of_stops.get(count)));
		} else if (type.equals("two_way_fare")) {
			ans = Double.parseDouble(two_way_fare.get(count)) * listStops.get(count).size()
					/ (Double.parseDouble(number_of_stops.get(count)));
		} else if (type.equals("weekly_fare")) {
			ans = Double.parseDouble(weekly_fare.get(count)) * listStops.get(count).size()
					/ (Double.parseDouble(number_of_stops.get(count)));
		} else if (type.equals("monthly_fare")) {
			ans = Double.parseDouble(monthly_fare.get(count)) * listStops.get(count).size()
					/ (Double.parseDouble(number_of_stops.get(count)));
		}
		return Math.round(ans * 100.0) / 100.0;
	}%>

				<%!void updateReserve() {
	try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		PreparedStatement stmt = con.prepareStatement(
				"INSERT INTO Reservation(res_id, username, res_date, trainId, transit_line_name, origin_datetime, dest_datetime, origin_stationId, destination_stationID, class, total_fare) VALUES (3, 'nrp114', '2008-7-04', 1002, 'North East Corridor', '2020-04-19 05:55:00', '2020-04-19 05:57:00', 4005, 4005, 'Economy', 20)");
		stmt.executeUpdate();
		//Result
	} catch (Exception e) {
		e.printStackTrace();
		//out.println("Error " + e.getMessage());
	}
}%>

				<table BORDER="1" id="table">
					<tr>
						<th>Number</th>
						<th>Train_ID</th>
						<th>Transit Line Name</th>
						<th>Transit Line Origin</th>
						<th>Transit Line Destination</th>
						<th>Origin Station Arrival</th>
						<th>Origin Station Departure</th>
						<th>Destination Station Arrival</th>
						<th>Stops</th>
						<th>Trip Type</th>
						<th>Fare + Class_Type_Cost*</th>
						<th>Reserve</th>
					</tr>
					<%
						while (available_trains.next()) {
					%>
					<tr>
						<td><%=count_available + 1%></td>
						<td><%=available_trains.getString(1)%></td>
						<td><%=available_trains.getString(2)%></td>
						<td><%=origin_station_train_schedule.get(count_available) %>
						<td><%=destination_station_train_schedule.get(count_available) %>
						<td><%=available_trains.getString(3)%></td>
						<td><%=available_trains.getString(4)%></td>
						<td><%=dest_arrival_time.get(count_available).toString()%></td>
						<td><%=listStops.get(count_available).toString()%></td>
						<td><%=request.getParameter("type")%></td>
						<td><%=GetFare(count_available, type, one_way_fare, two_way_fare, weekly_fare, monthly_fare, number_of_stops, listStops)%></td>
						<td>
							<%
								if (discount.equals("no")) {
								if (class_type.equals("economy")) {
							%> <input type="radio" name="checkBox" id="check_box"
							onclick="updateReserve1('0', '1')"> <%
 	} else if (class_type.equals("business")) {
 %> <input type="radio" name="checkBox" id="check_box"
							onclick="updateReserve1('10', '1')"> <%
 	} else {
 %> <input type="radio" name="checkBox" id="check_box"
							onclick="updateReserve1('15', '1')"> <%
 	}
 } else {
 	if (class_type.equals("economy")) {
 %> <input type="radio" name="checkBox" id="check_box"
							onclick="updateReserve1('0', '0.95')"> <%
 	} else if (class_type.equals("business")) {
 %> <input type="radio" name="checkBox" id="check_box"
							onclick="updateReserve1('10', '0.95')"> <%
 	} else {
 %> <input type="radio" name="checkBox" id="check_box"
							onclick="updateReserve1('15', '0.95')"> <%
 	}
 }
 %>
						</td>
					</tr>
					<%
						count_available++;
					}
					%>
				</table>
			</div>
			<br> <br>
			<div class="middle">
				<button onclick="selectRadio()">Reserve</button>
				<input type="hidden" id="username" name="username"
					value="<%=request.getParameter("username")%>"> <input
					type="hidden" id="password" name="password"
					value="<%=request.getParameter("password")%>"> <input
					type="hidden" id="origin_id" name="origin_id"
					value="<%=request.getParameter("origin")%>"> <input
					type="hidden" id="dest_id" name="dest_id"
					value="<%=request.getParameter("dest")%>"> <input
					type="hidden" id="train_id" name="train_id"> <input
					type="hidden" id="transit_line_name" name="transit_line_name">
				<input type="hidden" id="arrival_time" name="arrival_time">
				<input type="hidden" id="dest_time" name="dest_time">
				<input type = "hidden" id="final_dest_arrival" name = "final_dest_arrival">
				<input
					type="hidden" id="trip_type" name="trip_type" value="<%=request.getParameter("type")%>">
				 <input
					type="hidden" id="class_type" name="class_type"
					value="<%=request.getParameter("class_type")%>"> <input
					type="hidden" id="fare" name="fare"> <input type="hidden"
					id="origin_name" name="origin_name" value="<%=originStation%>">
				<input type="hidden" id="dest_name" name="dest_name"
					value="<%=destStation%>">
					<input type="hidden" id="opt" name="click" value="<%= "Sign In" %>">
				<script>
					function updateReserve1(class_type, discount) {
						//document.getElementById("demo").innerHTML = 34343;
						var row, table, train_id, transit_line_name, arrive_time, dest_time,final_dest_arrival, origin, dest, fare, disc, class_t;
						var ele = document.getElementsByName('checkBox');
						for (var i = 0; i < ele.length; i++) {
							if (ele[i].checked)
								row = Number(i) + 1;
						}
						disc = Number(discount);
						class_t = Number(class_type);
						table = document.getElementById("table");
						var i = Number(row);
						train_id = Number(table.rows[row].cells[1].innerHTML);
						transit_line_name = table.rows[row].cells[2].innerHTML;
						arrive_time = table.rows[row].cells[5].innerHTML;
						dest_time = table.rows[row].cells[6].innerHTML;
						final_dest_arrival = table.rows[row].cells[7].innerHTML;
						fare = (Number(table.rows[row].cells[10].innerHTML) + class_t);
						fare = Math.round((fare * disc) * 100) / 100;
						//document.getElementById("demo").innerHTML = fare;
						var trainID = document.getElementById("train_id");
						trainID.value = train_id;
						var transitLine = document
								.getElementById("transit_line_name");
						transitLine.value = transit_line_name;
						var arrivalTime = document
								.getElementById("arrival_time")
						arrivalTime.value = arrive_time;
						var destTime = document.getElementById("dest_time")
						destTime.value = dest_time;
						var final_arrival = document.getElementById("final_dest_arrival");
						final_arrival.value = final_dest_arrival;
						var fareAmount = document.getElementById("fare")
						fareAmount.value = fare;
					}

					function selectRadio() {
						//document.getElementById()
						document.getElementById("check_box").required = true;
					}
				</script>
			</div>
			</form>
		</div>
		<br>
		<br>
		<footer>
			<p>*Class Type Cost: This is the class type cost for the train. The class type cost is not included in the fare given in the above table. It will be added later. (Economy = Fare; Business: Fare + $10; First Class: Fare + $15)</p>
		</footer>
		<div>
		<% if(null!=request.getAttribute("errorMessage"))
    {
        out.println(request.getAttribute("errorMessage"));
    }
		%>
		</div>
</body>
</html>
