<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="./styleHome.css" /> 
<head>
<title>List Auction</title>
</head>
<body>
<form class="boxs" action="search.jsp" method="post" >
<h2 id="GQ">Search Result</h2>
<%@ page import="java.sql.*"%>

<%
String Brand = request.getParameter("brand");
String Year = request.getParameter("year");
String MileAge = request.getParameter("mileage");
String Type = request.getParameter("type");
String Condition = request.getParameter("condition");

try{
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://rucs336g33.c1g6evsz5qrw.us-east-2.rds.amazonaws.com:3306/user",
		  "cs336g33","mypassword");
Statement st=con.createStatement();

ResultSet rs = st.executeQuery("select * from auction where Brand = '"+Brand+"' and CarCondition = '"+Condition+"' and Year = '"+Year+"' and Type = '"+Type+"' ");
if(rs.next()){
	rs = st.executeQuery("select * from auction where Brand = '"+Brand+"' and CarCondition = '"+Condition+"' and Year = '"+Year+"' and Type = '"+Type+"' ");
out.println("<html><body><table><tr><td>AuctionID</td><td>Seller</td><td>CarCondition</td><td>Brand</td><td>Year</td><td>Type</td><td>EndTime</td><td>CurrentBid</td><td>Details</td></tr>");;
	
while (rs.next()){
	out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td><td>"+rs.getString(8)+"</td><td>"+"<a href="+ "detail.jsp"+"?"+"value="+rs.getString(1)+">"+"<div>"+"Show"+"</div></a>"+"</td></tr>");
}
out.println("</table></body></html>");
}
else{
	%>
	<h3 id="noCar">Sorry, We don't have the car you want right now</h3>
	<%
}
}catch(Exception e){
	e.printStackTrace();
}

%>
</form>
<form class="returnButton">
<a id="Return" href =" success.jsp"> Return to home </a >
</form>
</body>
</html>