<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="cs336LoginPage.*"%>
<%@ page
	import="java.io.*,java.util.*,java.sql.*,java.time.format.DateTimeFormatter,java.time.LocalDateTime, java.text.SimpleDateFormat, java.util.Date, java.util.Calendar, java.text.ParseException"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Post Question</title>
</head>
<body>

    <%--  <%  if(request.getParameter("submit")!= null){%>
		 <h1> Your questions have been recorded.</h1>
	<% } %>  --%>
<%
	String firstName = request.getParameter("fname");
	String lastName = request.getParameter("lname");
	String email = request.getParameter("email");
	String username = request.getParameter("username");
	String title = request.getParameter("title");
	String questions = request.getParameter("questions");
	int res_id = -1;
	try{
		res_id = Integer.parseInt(request.getParameter("res_id"));	
	}catch(Exception e){
		
	}
	/* out.println(firstName);
	out.println(lastName);
	out.println(email);
	out.println(username);
	out.println(title);
	out.println(questions);  */
	
	try {
		ApplicationDB db = new ApplicationDB();
		Connection connection = db.getConnection();
		Statement stmt = connection.createStatement();
		String query = "select max(unique_id) from CustomerService";
		ResultSet maxID = stmt.executeQuery(query);
		String maxUID = null;
		while(maxID.next()){
			maxUID = maxID.getString(1);
		}
		int uni_id = Integer.parseInt(maxUID) + 2; 
		PreparedStatement stmt1 = connection.prepareStatement("Insert into CustomerService (unique_id, res_id, username, title, concerns, email, firstName) Values (?, ?, ?, ?, ?, ?, ?)");
		stmt1.setInt(1, uni_id);
		if(res_id == -1){
			stmt1.setString(2, null);
		}else{
			stmt1.setInt(2, res_id);
		}
		stmt1.setString(3, username);
		stmt1.setString(4, title);
		stmt1.setString(5, questions);
		stmt1.setString(6, email);
		stmt1.setString(7, firstName);
		stmt1.executeUpdate();
		%>  
		<p style="color:blue;">Your question has been recorded. Customer Representative will help you as soon as possible.</p>
		<% 
	} catch (Exception e) {
		e.printStackTrace();
		out.println("Error " + e.getMessage());
	}
%>
<%
	String usrname = request.getParameter("username");
	String password = request.getParameter("password");
%>
<form method="post" action="welcome.jsp">
	<input type="hidden" id="username" name="username"
			value="<%=usrname%>"> <input type="hidden" id="password"
			name="password" value="<%= password %>"> <input type="hidden"
			id="opt" name="click" value="<%= "Sign In" %>">
	<button type="submit">Home</button>
</form>
</body>
</html>