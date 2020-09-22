<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs336LoginPage.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
<style>
input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=password], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
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

input[type=submit]:hover {
  background-color: #45a049;
}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
<head>
<meta charset="ISO-8859-1">
<title>SignUp/In</title>
<script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
</head>
<%
	String opt = request.getParameter("command");
	try{ 
		if(opt.equals("signup")){ %>
<body>
<h3>Welcome to the Sign Up Page</h3>

<div>
  <form method = "post" action="welcome.jsp">
    <label for="fname">First Name</label>
    <input type="text" id="fname" name="firstname" placeholder="Your name.." required>

    <label for="lname">Last Name</label>
    <input type="text" id="lname" name="lastname" placeholder="Your last name.." required>
    
    <label for="telephone">Telephone</label>
    <input type="text" id="telephone" name="telephone" placeholder="XXX-XXX-XXXX" required>
    
    <label for="address">Address</label>
    <input type="text" id="address" name="address" placeholder="Your address">
    
    <label for="city">City</label>
    <input type="text" id="city" name="city" placeholder="City">
    
    <label for="state">State</label>
    <input type="text" id="state" name="state" placeholder="State">
    
    <label for="zipcode">Zip Code</label>
    <input type="text" id="zipcode" name="zipcode">
    
    <label for="email">Email</label>
    <input type="text" id="email" name="email" placeholder="xyz@gmail.com">
    
    <label for="username">Username</label>
    <input type="text" id="username" name="username" required>
    
    <label for="password">Password</label>
    <input type="password" id="password" name="password" required>
      
    <input type="submit" name="click" value="Sign Up">
  </form>
</div>
</body>
<% }else { %>
<body>
<h3>Please Log In</h3>

<div>
  <form method = "post" action="welcome.jsp">    
    <label for="username">Username</label>
    <input type="text" id="username" name="username" required>
    
    <label for="password">Password</label>
    <input type="password" id="password" name="password" required>
      
    <input type="submit" name="click" value="Sign In">
  </form>
</div>
</body>
<% } }catch(Exception e){
	out.print(e.toString());	
}%>
</html>