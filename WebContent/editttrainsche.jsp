<!--Srushti Patel sap353-->

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
	String transit_line_name = request.getParameter("transit_line_name");
	String trainId = request.getParameter("trainId");
	String routeId = request.getParameter("routeId");
	String station_arrival_time = request.getParameter("station_arrival_time");
	String station_departure_time = request.getParameter("station_departure_time");
	String stationId = request.getParameter("stationId");
	String available_seats = request.getParameter("available_seats");
    

			
		
		try {
				
			java.lang.Class.forName("com.mysql.jdbc.Driver");
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://group18-336.cpfupltk9l6g.us-east-2.rds.amazonaws.com:3306/RAILWAY_REGISTRATION_FINAL2","Group18","Rutgers2022");
			Statement st=conn.createStatement();
             PreparedStatement ps = null;
			
				
			ResultSet rs=st.executeQuery("select DISTINCT * from Train_Schedule where trainId='"+trainId+"'");
			rs.next();
			if(rs.getString("trainId").equals(trainId))
			{
			//String sql ="Update Train_Schedule set origin_stationId='"+origin_stationId+"'Where trainId ='"+trainId+"'";
			//String sql2 ="Update Train_Schedule set destination_stationId='"+destination_stationId+"'Where trainId='"+trainId+"'";
			//String sql3 ="Update Train_Schedule set total_time ='"+total_time+"'Where trainId='"+trainId+"'";
			//String sql4 =" Update Train_Schedule set station_arrival_time='"+station_arrival_time+"'Where trainId='"+trainId+"'";
			String sql5 =" Update Train_Schedule set station_departure_time='"+station_departure_time+"'Where trainId='"+trainId+"'AND station_arrival_time='"+station_arrival_time+"'";
			String sql7 ="Update Train_Schedule set available_seats='"+available_seats+"'Where trainId='"+trainId+"' AND station_arrival_time='"+station_arrival_time+"'";
			
			//if(origin_stationId !=null){
			//st.executeUpdate(sql);
			//}
			//if( destination_stationId!= null){
			//st.executeUpdate(sql2);
			//}
			//if(total_time != null){
			//st.executeUpdate(sql3);
			//}
			//if( station_arrival_time!= null){
			//	st.executeUpdate(sql4);
			//	}
			if( station_departure_time!= null){
				st.executeUpdate(sql5);
				}
			if( available_seats!= null){
				st.executeUpdate(sql7);
				}
			out.println("Data sucecessfully Edited");
			String redirectURL = "ViewTrainSchedule.jsp";
			response.sendRedirect(redirectURL);
			}
			
	}catch(Exception e){
		out.println("Error");
		System.out.println(e);
	}
		
		
		%>
</body>
</html>