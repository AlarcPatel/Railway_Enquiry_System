<!-- Dhwani shah - dvs48 (Find active transit_lines) -->
<%@ page import ="java.sql.*" %>

<html>

<!-- pass data to the next page -->
<script type="text/javascript">
function toTransitPage(myMessage) {
    <!-- alert(myMessage.innerHTML); -->
    var trtainId = myMessage.innerHTML
    window.location.href = "ActiveTransitlines.jsp?trainId=" + trainId
}
</script>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Trains | TrainTicketReservationSystem</title>
    </head>
    <body>
        <form method="post" action="">
            <div align="center" >
           
           
          
                    <%
	   
	    String transit_line_name = request.getParameter("transit_line_name");
                    
	 String revenue = request.getParameter("revenue");
	
	%>
	<table border="1">
	<h3>
					list of most active transit line:
					<%
				
				
	
			%>
				</h3>
		
		


		<%
			try {

				Class.forName("com.mysql.jdbc.Driver");
			    Connection con = DriverManager.getConnection("jdbc:mysql://group18-336.cpfupltk9l6g.us-east-2.rds.amazonaws.com:3306/RAILWAY_REGISTRATION_FINAL2", "Group18","Rutgers2022");


				Statement stmt1 = con.createStatement();
				
				PreparedStatement ps = null;

				ResultSet rs = 
                stmt1.executeQuery("SELECT r.transit_line_name, count(*)revenue FROM Reservation r group by r.transit_line_name order by revenue desc LIMIT 5");
				
				while (rs.next()) {
		%>
		<tr>
		
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>

			
			
		</tr>

		<%
			}
				
		%>
		</tbody>
	</table>
	<%
                    }
                    catch(Exception e)
                    {
                         e.printStackTrace();
                    }
                   %>
            </div>
        </form>
    </body>
</html>