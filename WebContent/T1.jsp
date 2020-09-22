<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update customer representive's information</title>
</head>
<body>
</head>
<body>	
<!DOCTYPE html>
<html>
<head>
<style>

</style>
</head>
<body>


</div>

</body>
</html>
	
		<table style="display: table;  align: center">
			<br><div> Edit train reservation Information<br>
			<br>
			<form method="post" action="editreservation.jsp">
res_id:<br>
<input type="text" name="res_id">
<br>
username:<br>
<input type="text" name="username">
<br>
res_date:<br>
<input type="text" name="res_date" id = "datepicker-3">
<link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel = "stylesheet">
      <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
      
      <!-- Javascript -->
      <script>
         $(function() {
            $( "#datepicker-3" ).datepicker({
               appendText:"(yy-mm-dd)",
               dateFormat:"yy-mm-dd",
               altField: "#datepicker-4",
               altFormat: "DD, d MM, yy"
            });
         });
      </script>
<br>

trainId:<br>
<input type="text" name="trainId">
<br>
transit_line_name:<br>
<input type="text" name="transit_line_name">
<br>
origin_datetime:<br>
<input type="text" name="origin_datetime">
<br>
dest_datetime:<br>
<input type="text" name="dest_datetime">
<br>
origin_stationId:<br>
<input type="text" name="origin_stationId">
<br>
destination_stationID:<br>
<input type="text" name="destination_stationID">
<br>
classname:<br>
<input type="text" name="classname">
<br>
total_fare:<br>
<input type="text" name="total_fare">
<br>
trip_type:<br>
<input type="text" name="total_fare">
<br><br>
<input type="submit" value="submit">
</form>
</body>
<br>
	<form method="post" action="test.jsp">
	<table style="display: table;  align: center">
			<br><div> Add train reservation Information<br>
			<br>
	
res_id:<br>
<input type="text" name="res_id">
<br>
username:<br>
<input type="text" name="username">
<br>
res_date:<br>
<input type="text" name="res_date" id = "datepicker-3">
<link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel = "stylesheet">
      <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
      
      <!-- Javascript -->
      <script>
         $(function() {
            $( "#datepicker-3" ).datepicker({
               appendText:"(yy-mm-dd)",
               dateFormat:"yy-mm-dd",
               altField: "#datepicker-4",
               altFormat: "DD, d MM, yy"
            });
         });
      </script>
<br>

trainId:<br>
<input type="text" name="trainId">
<br>
transit_line_name:<br>
<input type="text" name="transit_line_name">
<br>
origin_datetime:<br>
<input type="text" name="origin_datetime">
<br>
dest_datetime:<br>
<input type="text" name="dest_datetime">
<br>
origin_stationId:<br>
<input type="text" name="origin_stationId">
<br>
destination_stationID:<br>
<input type="text" name="destination_stationID">
<br>
classname:<br>
<input type="text" name="classname">
<br>
total_fare:<br>
<input type="text" name="total_fare">
<br>
booking_fee:<br>
<input type="text" name="booking_fee">
<br>
trip_type:<br>
<input type="text" name="trip_type">
<br><br>
<input type="submit" value="submit">
</form>

<br>
<form method="post" action="deleteresevation.jsp">
<table style="display: table;  align: center">
			<p><br> Delete train reservation Information<br>
			<br>

res_id:<br>
<input type="text" name="res_id">
<br><br>
<input type="submit" value="submit">
</form>
<table>
</div>
</body>
</html>