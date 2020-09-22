<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String res_id = request.getParameter("res_id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://group18-336.cpfupltk9l6g.us-east-2.rds.amazonaws.com:3306/";
String database = "RAILWAY_REGISTRATION_FINAL2";
String userid = "Group18";
String password = "Rutgers2022";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from Reservation where res_id="+res_id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="styles/form.css">
<link rel="stylesheet" href="styles/homepage.css">
<link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel = "stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="styles/homepage.css">
<link rel="import" href="UI2.html">
<body>
<div class="container">  

  <form id="contact" action="update-reservation-process.jsp" method="post">
    <h3>Edit Reservation</h3>
    <fieldset>
      <input type="hidden" name="res_id" value="<%=resultSet.getString("res_id") %>">
<input type="text" name="res_id" value="<%=resultSet.getString("res_id") %>">
    </fieldset>
    <fieldset>
    <fieldset>
      <input placeholder="Username" type="text" tabindex="3" required name="username" value="<%=resultSet.getString("username") %>">
    </fieldset>
      <input placeholder="Reservation Date" type="text" tabindex="2" required name="res_date" id = "datepicker-3"  value="<%=resultSet.getString("res_date") %>">
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
    </fieldset>
   
    <fieldset>
      <input placeholder="Train ID" type="text" tabindex="4" required name="trainId" value="<%=resultSet.getString("trainId") %>">
    </fieldset>
    <fieldset>
      <input placeholder="Transit Line Name" type="text" tabindex="4" required name="transit_line_name" value="<%=resultSet.getString("transit_line_name") %>">
    </fieldset>
    <fieldset>
      <input placeholder="Origin Date Time" type="text" tabindex="4" required name="origin_datetime" value="<%=resultSet.getString("origin_datetime") %>">
    </fieldset>
    <fieldset>
      <input placeholder="Destination Date Time:" type="text" tabindex="4" required name="dest_datetime" value="<%=resultSet.getString("dest_datetime") %>">
    </fieldset>
    <fieldset>
      <input placeholder="Origin Station ID" type="text" tabindex="4" required name="origin_stationId" value="<%=resultSet.getString("origin_stationId") %>">
    </fieldset>
    <fieldset>
      <input placeholder="Destination Station ID" type="text" tabindex="4" required name="destination_stationID" value="<%=resultSet.getString("destination_stationID") %>">
    </fieldset>
    <fieldset>
      <input placeholder="Class Name" type="text" tabindex="4" required name="classname" value="<%=resultSet.getString("classname") %>">
    </fieldset>
    <fieldset>
      <input placeholder="Total Fare" type="text" tabindex="4" required name="total_fare" value="<%=resultSet.getString("total_fare") %>">
    </fieldset>
    <fieldset>
      <input placeholder="Booking Fees" type="text" tabindex="4" required name="booking_fee" value="<%=resultSet.getString("booking_fee") %>">
    </fieldset>
    <fieldset>
      <input placeholder="Trip Type" type="text" tabindex="4" required name="trip_type" value="<%=resultSet.getString("trip_type") %>">
    </fieldset>
    <fieldset>
      <button name="submit" type="submit" id="contact-submit" data-submit="...Updating">Submit</button>
    </fieldset>
  </form>
</div>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>