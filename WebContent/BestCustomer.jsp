<!-- Dhwani shah - dvs48 (Best Customer) -->
<%@ page import ="java.sql.*" %>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Train | Train Savers</title>
    </head>
    <body>
       	<div align="center" >
       	
       	<%
	   
		String firstName = request.getParameter("firstName");
    	String lastName = request.getParameter("lastName");
	    String revenue = request.getParameter("number of reservations");
	    
	    
	     
	%>
	<table border="1">
	<h3>
					Best customer who generated most revenue: 
					<%
					
	
			%>
				</h3>
		
		<tr>
		<td>firstName</td>
		   <td>lastName</td>
		   <td>revenue</td>
		    
			
			
		</tr>
       		<%
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://group18-336.cpfupltk9l6g.us-east-2.rds.amazonaws.com:3306/RAILWAY_REGISTRATION_FINAL2","Group18","Rutgers2022");
				Statement st = conn.createStatement();
				ResultSet rs = 
		                
						st.executeQuery("select c.firstName, c.lastName,count(*)revenue from Reservation r , Customer c where r.username=c.username group by r.username order by revenue desc limit 1");
		                
					
					while (rs.next()) {
						%>
						<tr>
						
							<TD> <%= rs.getString(1) %> </TD>
				               <TD> <%= rs.getString(2) %> </TD>
				                <TD> <%= rs.getString(3) %> </TD>
				                
							
							
							
				              
						</tr>

						<%
							}


    
					
                    }
                    catch(Exception e)
                    {
                         e.printStackTrace();
                    }
            %>
       	</div>
    </body>
</html>