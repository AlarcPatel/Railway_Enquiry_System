<!-- Dhwani shah - dvs48 -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%	
	String firstName = request.getParameter("firstName");
	String lastName = request.getParameter("lastName");
	String telephone = request.getParameter("telephone");
	String address = request.getParameter("address");
	String city = request.getParameter("city");
	String state = request.getParameter("state");
	String zipcode = request.getParameter("zipcode");
	String email = request.getParameter("email");
	String username = request.getParameter("username");
	String password = request.getParameter("password");


			
		
		try {
				
			java.lang.Class.forName("com.mysql.jdbc.Driver");
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://group18-336.cpfupltk9l6g.us-east-2.rds.amazonaws.com:3306/RAILWAY_REGISTRATION_FINAL2","Group18","Rutgers2022");
			Statement st=conn.createStatement();
             PreparedStatement ps = null;
			
				
			ResultSet rs=st.executeQuery("select DISTINCT * from Customer where username='"+username+"'");
			rs.next();
			if(rs.getString("username").equals(username))
			{
			String sql ="Update Customer set firstName='"+firstName+"'Where username ='"+username+"'";
			String sql2 ="Update Customer set lastName='"+lastName+"'Where username='"+username+"'";
	        String sql3 ="Update Customer set telephone ='"+telephone+"'Where username='"+username+"'";
			String sql4 =" Update Customer set address='"+address+"'Where username='"+username+"'";
			String sql5 =" Update Customer set city='"+city+"'Where username='"+username+"'";
			String sql6 ="Update Customer set state='"+state+"'Where username='"+username+"'";
			String sql7 ="Update Customer set zipcode='"+zipcode+"'Where username='"+username+"'";
			String sql8 ="Update Customer set email='"+email+"'Where username='"+username+"'";
			String sql10 ="Update Customer set password='"+password+"'Where username='"+password+"'";

			if(firstName !=null){
			st.executeUpdate(sql);
			}
			if( lastName!= null){
			st.executeUpdate(sql2);
			}
			if(telephone != null){
			st.executeUpdate(sql3);
			}
			if( address!= null){
				st.executeUpdate(sql4);
				}
			if( city!= null){
				st.executeUpdate(sql5);
				}
			if( state!= null){
				st.executeUpdate(sql6);
				}
			if (zipcode!= null){
				st.executeUpdate(sql7);
				}
			if(email!= null){
					st.executeUpdate(sql8);
					}
			if(password!= null){
				st.executeUpdate(sql10);
				}
			out.println("Data sucecessfully Edited");
			}
			
	}catch(Exception e){
		out.println("Error");
		System.out.println(e);
	}
		
		
		%>
</body>
</html>