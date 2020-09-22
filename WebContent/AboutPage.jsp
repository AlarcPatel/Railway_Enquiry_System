<!-- Dhwani shah - dvs48 -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<meta charset="UTF-8">
<style> 
body {
  background-image: url("white.jpeg");
  background-repeat: no-repeat;
  background-size: cover;
  background-position: fixed;
  background-top:0;
  background-left:0;
  background-min-width: 100%;
  background-min-height: 100%;
  }
  
h1 {
  color: #f29111;
  font-family: times new roman;
  font-size: 250%;
  text-align: left;
}
hr { 
border-color: grey;
}
p{
color: #00758f;
text-indent: 50px;
font-size: 132%;
font-family: times new roman;
}
form {
text-align: center;
}
input {
background-color: gradient;
font-family: times new roman;
}


</style>
<title>About Page</title>
</head>
<body>
	
	<h1> Train Ticket Reservation System </h1>
	<hr>
	<p> Welcome to Train Ticket Reservation System. This Site is created by five members of Group 18 named: Dhwani shah, Harsh Patel, Nisarg Patel, Srushti Patel, Alark patel.
	    This Web site is essentially a adaptation of Online Train Ticket Reservation System and it was done as a project to represent in the CS336 class at Rutgers University.
	</p>
	<p>	Any credit card information is not stored or used for any other cause. Train Ticket Reservation System is just used as a representation for a customer to book a ticket.
	    We hope you find the site easy to navigate. 
	</p>
	<p>	Please feel free to email:- dvs48@scarletmail.rutgers.edu if you have any questions or concerns.   
	            Train Ticket Reservation System wishes you a Happy and Safe Travels!
	</p>
	 <form method = "post" action = "index.jsp"> <input type = "submit" value = "Continue back to login page."></form>
	
</body>
</html>