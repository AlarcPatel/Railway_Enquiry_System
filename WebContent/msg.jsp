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
	background-image: url('back.jpg');
}
</style>
<meta charset="ISO-8859-1">
<title>Welcome to Customer Service</title>
</head>
<body>
	<h1 style="color: Green; font-family: ariel">Welcome to Help Page</h1>
	<%
		String username = request.getParameter("username");
	String password = request.getParameter("password");
	%>
	<form method="post" action="alert.jsp">
		<input type="hidden" id="username" name="username"
			value="<%=username%>"> <input type="hidden" id="password"
			name="password" value="<%=password%>"> <input type="hidden"
			id="opt" name="click" value="<%="Sign In"%>">
		<button type="submit"
			style="font-size: 20px; cursor: pointer; background-color: powderblue; margin-left: auto; margin-right: auto; display: block; margin-top: 1%; margin-bottom: 0%">
			Alert Message</button>
	</form>
	<form method="post" action="Cs.jsp">
		<input type="hidden" id="username" name="username"
			value="<%=username%>"> <input type="hidden" id="password"
			name="password" value="<%=password%>"> <input type="hidden"
			id="opt" name="click" value="<%="Sign In"%>">
		<!-- Button formate -->
		<button type="submit"
			style="font-size: 20px; background-color: powderblue; margin-left: auto; margin-right: auto; display: block; margin-top: 11.2%; margin-bottom: 2%;">
			Post new Question</button>

	</form>
	<!-- For aliging href in to center  -->
	<p style="text-align: center;">
		<a href="Browse.jsp">FAQ's</a>
	</p>
	<form class="example" action="find.jsp">
		<input type="hidden" id="username" name="username" value="<%=username%>"> <input type="hidden"
			id="password" name="password" value="<%=password%>"> <input
			type="hidden" id="opt" name="click" value="<%="Sign In"%>"> <input
			type="text" placeholder="Search.." name="search">
		<button type="submit" style="background-color: yellow;">
			<i class="fa fa-search">Search</i>
		</button>

	</form>
	<form method="post" action="welcome.jsp">
		<input type="hidden" id="username" name="username"
			value="<%=username%>"> <input type="hidden" id="password"
			name="password" value="<%=password%>"> <input type="hidden"
			id="opt" name="click" value="<%="Sign In"%>">
		<button type="submit"
			style="font-size: 20px; cursor: pointer; background-color: powderblue; margin-left: auto; margin-right: auto; display: block; margin-top: 1%; margin-bottom: 0%">
			Home</button>
	</form>
</body>
</html>