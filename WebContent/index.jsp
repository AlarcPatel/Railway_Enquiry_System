<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
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

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
<body>

<h3>Welcome to the Railway Registration</h3>

<div>
  <form method = "get" action="sign_up_in.jsp">
  <h3>For Customers</h3>
    New User? Sign Up <input type="radio" name="command" value="signup"/>
	<br>
	<br>
    Already a user? Log In <input type="radio" name="command" value="login"/>
	<br>
	<br>
    <input type="submit" value="Submit">
  </form>
</div>
<br>
<br>
<div>
  <form method = "get" action="adminlogin.jsp">
  	<h3>For Admin</h3>
    <label for="username">Username</label>
    <input type="text" id="username" name="username" required>
    
    <label for="password">Password</label>
    <input type="password" id="password" name="password" required>
      
    <input type="submit" name="click" value="Sign In">
  </form>
</div>
<br>
<br>
<div>
  <form method = "get" action="UI2.jsp">
  	<h3>For Customer Representative/Employees</h3>
    <label for="username">Username</label>
    <input type="text" id="username" name="username" required>
    
    <label for="password">Password</label>
    <input type="password" id="password" name="password" required>
      
    <input type="submit" name="click" value="Sign In">
  </form>
</div>
</body>
</html>