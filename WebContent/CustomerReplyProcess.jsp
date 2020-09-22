<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="cs336LoginPage.*"%>
<%@ page import="JavaEmail.JavaEmail"%>
<%@ page import="javax.mail.MessagingException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>
<%@ page import="java.io.* ,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<%
	///String answer = null;
	String status = null;
	String unique_id = request.getParameter("unique_id");
	String employee_ssn = request.getParameter("employee_ssn");
	String answers = request.getParameter("answers");
	if (request.getParameter("submit") != null) {
		JavaEmail javaEmail = new JavaEmail();
		javaEmail.setMailServerProperties();
		String emailSubject = "Customer Reply";
		String emailBody = "";
		if (request.getParameter("name") != null) {
			emailBody = "Sender Name: " + request.getParameter("name")
					+ "<br>";
		}
		
		if (request.getParameter("email") != null) {
			emailBody = emailBody + "Sender Email: "
					+ request.getParameter("email") + "<br>";
		}
		if (request.getParameter("phone") != null) {
			emailBody = emailBody + "Sender Phone: "
					+ request.getParameter("phone") + "<br>";
		}
		if (request.getParameter("concerns") != null) {
			emailBody = emailBody + "Concerns: " + request.getParameter("concerns")
					+ "<br>";
		}
		if (request.getParameter("answers") != null) {
			emailBody = emailBody + "Message: " + request.getParameter("answers")
					+ "<br>";
		}
		javaEmail.createEmailMessage(emailSubject, emailBody);
		try {
			javaEmail.sendEmail();
			status = "success";
			answers = request.getParameter("answers");
		} catch (MessagingException me) {
			status = "error";
			answers = request.getParameter("answers");
		}
	}
%>
<%
//String unique_id = request.getParameter("unique_id");
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
String sql ="select * from CustomerService where unique_id="+unique_id;
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

  <form id="contact" name="frmContact" method="POST"
					novalidate="novalidate">
    <h3>Reply Customer</h3>
    <fieldset>
      <input type="hidden" name="unique_id" value="<%=resultSet.getString("unique_id") %>">
<input type="text" name="unique_id" value="<%=resultSet.getString("unique_id") %>">
    </fieldset>

    <fieldset>
      <input placeholder="First Name" type="text" tabindex="3" required name="firstName" value="<%=resultSet.getString("firstName") %>">
    </fieldset>
      
    <fieldset>
      <input placeholder="Email" type="text" tabindex="4" required name=email value="<%=resultSet.getString("email") %>">
    </fieldset>
    <fieldset>
      <input placeholder="Question" type="text" tabindex="4" required name="concerns" value="<%=resultSet.getString("concerns") %>">
    </fieldset>
    <fieldset>
      <input placeholder="answers" type="text" tabindex="4" required name="answers" value="<%=resultSet.getString("answers") %>">
    </fieldset>
    <fieldset>
      <input placeholder="Answered By" type="text" tabindex="4" required name="employee_ssn" value="<%=resultSet.getString("employee_ssn") %>">
    </fieldset>
    
    <fieldset>
      <button name="submit" type="submit" id="contact-submit" data-submit="...Replying">Reply</button>
    </fieldset>
    <%
						if (null != answers) {
							out.println("<div class='" + status + "'>"
									+ answers + "</div>");
							try {
								
								java.lang.Class.forName("com.mysql.jdbc.Driver");
							    Connection con = DriverManager.getConnection("jdbc:mysql://group18-336.cpfupltk9l6g.us-east-2.rds.amazonaws.com:3306/RAILWAY_REGISTRATION_FINAL2", "Group18","Rutgers2022");
								Statement stmt = con.createStatement();
								PreparedStatement ps = null;
								
									
								ResultSet rs=stmt.executeQuery("select * from CustomerService where unique_id = '"+unique_id+"'");
								rs.next();
								if(rs.getString("unique_id").equals(unique_id))
								{
								
								String sql1 ="Update CustomerService set answers='"+answers+"'Where unique_id='"+unique_id+"'";
								String sql2 ="Update CustomerService set employee_ssn='"+employee_ssn+"'Where unique_id='"+unique_id+"'";

								
								if( answers!= null){
									stmt.executeUpdate(sql1);
									stmt.executeUpdate(sql2);
									}
								out.println("Email Sent!");
								String redirectURL = "CustomerQuestion.jsp";
								response.sendRedirect(redirectURL);
								}
								
						}catch(Exception e){
							out.println("Error");
							System.out.println(e);
						}
						}
					
					
					%>
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