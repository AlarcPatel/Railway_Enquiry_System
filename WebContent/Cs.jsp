<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Service!</title>
<style type="text/css">

#example1 { width: 50%; }
#example2 { width: 150px; }

select { width: 300px; }

textarea {
width: 300px;
height: 10em;
}

</style>
</head>
<h1>Customer Services</h1>
<form action="postQuestion.jsp" method="post">
  <input type="text" id="fname" name="fname" size="32" placeholder="First Name"required><br><br />
  <input type="text" id="lname" name="lname" placeholder="Last Name" size="32" required><br><br />
  <input type="email" id="email" name="email" placeholder="Email" size="32" required><br><br />
  <input type="text" id="username" name="username" size="32" placeholder="Username" required><br><br />
  <input type="number" id="res_id" placeholder="Reservation Number (Optional)" size = "35"><br><br />
  <input type="text" id="title" name="title" placeholder="Title" size= 40 required><br><br />
  <p>
  <%
 	String username = request.getParameter("username");
	String password = request.getParameter("password");	
  	String q  = request.getParameter("question");
  	if(q == null){
  		%>
  			<textarea name="questions" cols="50" rows="50" placeholder="Type your questions here."required></textarea>
  		<%
  	}else{
  		%>
  		<textarea name="questions" cols="50" rows="50" placeholder="Type your questions here."required><%=q%></textarea>
  		<%
  	}
  %>
  </p>
	<input type="hidden" id="username" name="username"
			value="<%=username%>"> <input type="hidden" id="password"
			name="password" value="<%= password %>"> <input type="hidden"
			id="opt" name="click" value="<%= "Sign In" %>">
      <button type="submit">Submit</button>
</form>
<body >
 
    
</body>
</html>