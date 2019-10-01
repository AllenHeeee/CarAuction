<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
<title>Similar Auction</title>
<style type="text/css">
table tr td,th
{
    border:1px solid #098;
}
</style>
</head>
<body>
<%@ page import="java.sql.*"%>
<%
String v = request.getParameter("value");
int val = Integer.parseInt(v);
ResultSet rc = null;
try{
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://rucs336g33.c1g6evsz5qrw.us-east-2.rds.amazonaws.com:3306/user",
		  "cs336g33","mypassword");
Statement st=con.createStatement();
out.println("<html><body><table><tr><td>AuctionID</td><td>Seller</td><td>CarCondition</td><td>Brand</td><td>Year</td><td>Type</td><td>EndTime</td><td>CurrentBid</td><td>Mileage</td><td>Model</td><td>No.Bids</td></tr>");
String C = null;
String T = null;

ResultSet rs = null;
rs = st.executeQuery("select * from auction where AuctionID='"+val+"'");

while (rs.next()){
	out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td><td>"+rs.getString(8)+"</td><td>"+rs.getString(12)+"</td><td>"+rs.getString(13)+"</td><td>"+rs.getString(14)+"</td></tr>");
	C = rs.getString(3);
	T = rs.getString(6);
}
out.println("</table></body></html>");
rc = st.executeQuery("select * from auction where AuctionID != '"+val+"' and CarCondition = '"+C+"' and Type = '"+T+"'");
}catch(Exception e){
	e.printStackTrace();
	
} 
%><hr><%
try{
	if(rc.next()){
		rc.previous();
out.println("<h2>Recommandation Auctions</h2>");
out.println("<html><body><table><tr><td>AuctionID</td><td>Seller</td><td>CarCondition</td><td>Brand</td><td>Year</td><td>Type</td><td>EndTime</td><td>CurrentBid</td><td>Mileage</td></tr>");
while (rc.next()){
	out.println("<tr><td>"+rc.getString(1)+"</td><td>"+rc.getString(2)+"</td><td>"+rc.getString(3)+"</td><td>"+rc.getString(4)+"</td><td>"+rc.getString(5)+"</td><td>"+rc.getString(6)+"</td><td>"+rc.getString(7)+"</td><td>"+rc.getString(8)+"</td><td>"+rc.getString(12)+"</td></tr>");
out.println("</table></body></html>");
}}else{
	out.println("<h2>No more recommandations</h2>");
}
	
}
	catch(Exception e){
	e.printStackTrace();
}

%>

<form class="returnButton">
<a id="Return" href ="success.jsp"> Return to home </a >
</form>

</body>
</html>