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
	String res_id = request.getParameter("res_id");
	String username = request.getParameter("username");
	String res_date = request.getParameter("res_date");
	String trainId = request.getParameter("trainId");
	String transit_line_name = request.getParameter("transit_line_name");
	String origin_datetime = request.getParameter("origin_datetime");
	String dest_datetime = request.getParameter("dest_datetime");
	String origin_stationId = request.getParameter("origin_stationId");
	String destination_stationID = request.getParameter("destination_stationID");
	String classname = request.getParameter("classname");
	String total_fare = request.getParameter("total_fare");
	String trip_type = request.getParameter("trip_type");		
		
		try {
				
			java.lang.Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://group18-336.cpfupltk9l6g.us-east-2.rds.amazonaws.com:3306/RAILWAY_REGISTRATION_FINAL2", "Group18","Rutgers2022");
			Statement stmt = con.createStatement();
			PreparedStatement ps = null;
			
				
			ResultSet rs=stmt.executeQuery("select * from Reservation where res_id = '"+res_id+"'");
			rs.next();
			if(rs.getString("res_id").equals(res_id))
			{
			//String sql1 ="Update Reservation set username='"+username+"'Whereres_id='"+res_id+"'";
			String sql2 ="Update Reservation set res_date='"+res_date+"'Where res_id='"+res_id+"'";
			//String sql3 ="Update Reservation set trainId='"+trainId+"'Where res_id='"+res_id+"'";
			String sql4 ="Update Reservation set transit_line_name='"+transit_line_name+"'Where res_id='"+res_id+"'";
			//String sql5 ="Update Reservation set origin_datetime='"+origin_datetime+"'Where res_id='"+res_id+"'";
			//String sql6 ="Update Reservation set dest_datetime='"+dest_datetime+"'Where res_id='"+res_id+"'";
			//String sql7 ="Update Reservation set origin_stationId='"+origin_stationId+"'Where res_id='"+res_id+"'";
			//String sql8 ="Update Reservation set destination_stationID='"+destination_stationID+"'Where res_id='"+res_id+"'";
			String sql9 ="Update Reservation set classname='"+classname+"'Where res_id='"+res_id+"'";
			String sql10 ="Update Reservation set total_fare='"+total_fare+"'Where res_id='"+res_id+"'";
			String sql11 ="Update Reservation set trip_type='"+trip_type+"'Where res_id='"+res_id+"'";
  
			//if(username !=null){
			//stmt.executeUpdate(sql1);
			//}
			if(res_date!= null){
			stmt.executeUpdate(sql2);
			}
			//if(trainId != null){
			//stmt.executeUpdate(sql3);
			//}
			if( transit_line_name!= null){
				stmt.executeUpdate(sql4);
				}
			//if( origin_datetime!= null){
			//	stmt.executeUpdate(sql5);
			//	}
			//if( dest_datetime!= null){
			//	stmt.executeUpdate(sql6);
			//	}
			//if( origin_stationId!= null){
			//	stmt.executeUpdate(sql7);
			//	}
			//if( destination_stationID!= null){
			//	stmt.executeUpdate(sql8);
			//	}
			if( classname!= null){
				stmt.executeUpdate(sql9);
				}
			if( total_fare!= null){
				stmt.executeUpdate(sql10);
				}
			if(trip_type!= null){
				stmt.executeUpdate(sql11);
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