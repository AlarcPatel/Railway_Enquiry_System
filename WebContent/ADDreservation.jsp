<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles/form.css">
<link rel="stylesheet" href="styles/homepage.css">
<link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel = "stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="styles/homepage.css">

</head>
<body>
<jsp:include page="customerRepresntive.html"/>

<div class="container">  

  <form id="contact" action="test.jsp" method="post">
    <h3>Add Reservation</h3>
    <fieldset>
      <input placeholder="Reservation ID" type="text" tabindex="1" required autofocus name="res_id">
    </fieldset>
    <fieldset>
    <fieldset>
      <input placeholder="Username" type="text" tabindex="3" required name="username">
    </fieldset>
      <input placeholder="Reservation Date" type="text" tabindex="2" required name="res_date" id = "datepicker-3">
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
      <input placeholder="Train ID" type="text" tabindex="4" required name="trainId">
    </fieldset>
    <fieldset>
      <input placeholder="Transit Line Name" type="text" tabindex="4" required name="transit_line_name">
    </fieldset>
    <fieldset>
      <input placeholder="Origin Date Time" type="text" tabindex="4" required name="origin_datetime">
    </fieldset>
    <fieldset>
      <input placeholder="Destination Date Time:" type="text" tabindex="4" required name="dest_datetime">
    </fieldset>
    <fieldset>
      <input placeholder="Origin Station ID" type="text" tabindex="4" required name="origin_stationId">
    </fieldset>
    <fieldset>
      <input placeholder="Destination Station ID" type="text" tabindex="4" required name="destination_stationID">
    </fieldset>
    <fieldset>
      <input placeholder="Class Name" type="text" tabindex="4" required name="classname">
    </fieldset>
    <fieldset>
      <input placeholder="Total Fare" type="text" tabindex="4" required name="total_fare">
    </fieldset>
    <fieldset>
      <input placeholder="Booking Fees" type="text" tabindex="4" required name="booking_fee">
    </fieldset>
    <fieldset>
      <input placeholder="Trip Type" type="text" tabindex="4" required name="trip_type">
    </fieldset>
    <fieldset>
      <button name="submit" type="submit" id="contact-submit" data-submit="...Adding">Submit</button>
    </fieldset>
  </form>
</div>
</body>
</html>
    