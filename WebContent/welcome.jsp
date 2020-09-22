<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="cs336LoginPage.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<style>
body, html {
	height: 100%;
	margin: 0;
}

input[type=submit] {
	width: 100%;
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button[type=submit] {
	width: 100%;
	background-color: orange;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.bgimg {
	background-image: url('train.jpg');
	height: 100%;
	background-position: center;
	background-size: cover;
	position: relative;
	color: white;
	font-family: "Courier New", Courier, monospace;
	font-size: 25px;
}

.topleft {
	position: absolute;
	top: 0;
	left: 16px;
}

.middleleft {
	position: absolute;
	top: 35%;
	left: 5%;
	bottom: 0;
	left: 16px;
}

.middleleftPlus {
	position: absolute;
	top: 25%;
	left: 5%;
	bottom: 0;
	left: 16px;
}

.middleright {
	position: absolute;
	top: 45%;
	left: 5%;
	bottom: 0;
	left: 16px;
}

.bottomright {
	position: absolute;
	bottom: 0;
	right: 16px;
}

.bottomleft {
	position: absolute;
	bottom: 0;
	left: 16px;
}

.middle {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	text-align: center;
}

hr {
	margin: auto;
	width: 40%;
}
</style>
<head>
<meta charset="ISO-8859-1">
<title>Welcome Page</title>
<script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
</head>
<body>
	<%
//response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
String opt = request.getParameter("click");
if(opt.equals("Sign In")){ 
String username = null;
String password = null;
boolean isUser = false;
try{	
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();		
		Statement stmt = con.createStatement();
		//Get the selected radio button from the index.jsp
		username = request.getParameter("username");
		password = request.getParameter("password");
		
		String str = "SELECT * FROM Customer WHERE username = '"+ username +"' AND password = '"+ password +"'" ;
		ResultSet result = stmt.executeQuery(str);
		
		while(result.next()){
			out.print("<p>");
			isUser = true;
%>
	<div class="bgimg">
		<div class="topleft">
			<h1 style="color: red;">Railway Registration Page</h1>
		</div>
		<div class="middle">
			<h2 style="color: red;">
				Welcome,
				<% out.print(result.getString("firstName")); %>!!!
			</h2>
			<hr>
		</div>
		<div class="middleleftPlus">
			<form method="post" action="msg.jsp">
				<input type="hidden" id="username" name="username"
					value="<%= request.getParameter("username")%>"> <input
					type="hidden" id="password" name="password" value="<%= password %>">
				<input type="hidden" id="opt" name="opt" value="<%= "Sign In" %>">
				<button type="submit">Help/Contact</button>
			</form>
		</div>
		<div class="middleleft">
			<form method="post" action="reserve.jsp">
				<input type="hidden" id="username" name="username"
					value="<%= request.getParameter("username")%>"> <input
					type="hidden" id="password" name="password" value="<%= password %>">
				<input type="hidden" id="opt" name="opt" value="<%= "Sign In" %>">
				<button type="submit">Make Reservation</button>
			</form>
		</div>
		<div class="middleright">
			<form method="post" action="reservationDetails.jsp">
				<input type="hidden" id="username" name="username"
					value="<%= request.getParameter("username")%>"> <input
					type="hidden" id="password" name="password" value="<%= password %>">
				<button type="submit">Reservation Details</button>
			</form>
		</div>
		<div class="bottomright">
			<p style="color: #34ebcc;">Created by Group18</p>
		</div>
		<div class="bottomleft">
			<form method="post" action="index.jsp">
				<input type="submit" value="Log Out">
			</form>
		</div>
	</div>
	<% 
		}
		if(isUser == false){
			out.print("Please enter valid username and password");
			%>
			<form method="post" action="index.jsp">
				<input type="submit" value="Go Back">
			</form>
			<%
		}
		db.closeConnection(con);
		//response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
}
catch (Exception e) {
	out.print(e);
}
}else{
	boolean check = true;
	try{
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();		
		boolean isUser = false;
		int zip_code = 0;
		//Create a SQL statement
		Statement stmt = con.createStatement();
		String firstName = request.getParameter("firstname");
		String lastName = request.getParameter("lastname");
		String telephone = request.getParameter("telephone");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zipcode = request.getParameter("zipcode");
		if(zipcode != null && !zipcode.equals("")){
			zip_code = Integer.parseInt(zipcode);
		}
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		String str = "SELECT * FROM Customer WHERE username = '"+ username +"'";
		ResultSet result = stmt.executeQuery(str);
		if(result.next()){
			out.print("Sorry, username is already taken!!! ");
			throw new Exception();
		}
		
		String insert = "INSERT INTO Customer(firstName, lastName, telephone, address, city, state, zipcode, email, username, password)"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, firstName);
		ps.setString(2, lastName);
		ps.setString(3, telephone);
		ps.setString(4, address);
		ps.setString(5, city);
		ps.setString(6, state);
		ps.setInt(7, zip_code);
		ps.setString(8, email);
		ps.setString(9, username);
		ps.setString(10, password);
		ps.executeUpdate();
		//response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
	<div class="bgimg">
		<div class="topleft">
			<h1 style="color: red;">Railway Registration Page</h1>
		</div>
		<div class="middle">
			<h2 style="color: red;">
				Welcome,
				<% out.print(firstName); %>!!!
			</h2>
			<hr>
		</div>
		<div class="middleleftPlus">
			<form method="post" action="msg.jsp">
				<input type="hidden" id="username" name="username"
					value="<%= request.getParameter("username")%>"> <input
					type="hidden" id="password" name="password" value="<%= password %>">
				<input type="hidden" id="opt" name="opt" value="<%= "Sign In" %>">
				<button type="submit">Help/Contact</button>
			</form>
		</div>
		<div class="middleleft">
			<form method="post" action="reserve.jsp">
				<input type="hidden" id="username" name="username"
					value="<%= request.getParameter("username")%>"> <input
					type="hidden" id="password" name="password" value="<%= password %>">
				<button type="submit">Make Reservation</button>
			</form>
		</div>
		<div class="middleright">
			<form method="post" action="reservationDetails.jsp">
				<input type="hidden" id="username" name="username"
					value="<%= request.getParameter("username")%>"> <input
					type="hidden" id="password" name="password" value="<%= password %>">
				<input type="hidden" id="opt" name="click" value="<%= "Sign In" %>">
				<button type="submit">Reservation Details</button>
			</form>
		</div>
		<div class="bottomright">
			<p style="color: #34ebcc;">Created by Group18</p>
		</div>

		<div class="bottomleft">
			<form method="post" action="index.jsp">
				<input type="submit" value="Log Out">
			</form>
		</div>
	</div>
	<%
		db.closeConnection(con);
		//out.print("Successfully created you account");
	}catch(Exception e){
		check = false;
		out.print(e.toString());
	}
}
%>
</body>
</html>