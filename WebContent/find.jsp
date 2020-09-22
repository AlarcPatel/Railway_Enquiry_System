<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="cs336LoginPage.*"%>
<%@ page
	import="java.io.*,java.util.*,java.sql.*,java.time.format.DateTimeFormatter,java.time.LocalDateTime, java.text.SimpleDateFormat, java.util.Date, java.util.Calendar, java.text.ParseException"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
 <%
 	String keyword = request.getParameter("search");
 	ResultSet list = null;
 	try{
 			keyword = "%" + keyword + "%";
			ApplicationDB db = new ApplicationDB();
			Connection connection = db.getConnection();
			PreparedStatement stmt = connection.prepareStatement("select concerns, answers from CustomerService where answers like ? or concerns like ?");
			stmt.setString(1, keyword);
			stmt.setString(2, keyword);
		    list = stmt.executeQuery();
			//int s = Integer.parseInt(request.getParameter("search"));
			if(!list.next()){
				%>
					<form class="example" action="Cs.jsp">
						 <input type="hidden" id="question" name="question" value="<%=keyword%>">
	 					 <button class="postQ">Post Question</button>
					</form>
				<%
			}else{
				list = stmt.executeQuery();
			}
		}catch(Exception e){
			e.printStackTrace();
			out.println("Error " + e.getMessage());
	} 
%> 
<table BORDER="1" id="table">
	<tr>
		<th>Questions</th>
		<th>Answers</th>
	<%
	while (list.next()) {
	%>
		<tr>
			<td><%=list.getString(1)%></td>
			<td><%=list.getString(2)%></td>
		</tr>
	<%
	}
	%>
</table>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
%>
<form method="post" action="welcome.jsp">
	<input type="hidden" id="username" name="username"
			value="<%=username%>"> <input type="hidden" id="password"
			name="password" value="<%= password %>"> <input type="hidden"
			id="opt" name="click" value="<%= "Sign In" %>">
	<button type="submit">Home</button>
</form>

</body>
</html>