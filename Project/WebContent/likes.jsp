<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Result</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%
String name=session.getAttribute("username").toString();
int AuctionID=Integer.parseInt(request.getParameter("AuctionID"));
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://rucs336g33.c1g6evsz5qrw.us-east-2.rds.amazonaws.com:3306/user",
		"cs336g33","mypassword");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from likes where AuctionID = '"+AuctionID+"' and customerID = '"+name+"'");
if(rs.next()){
	out.println("You already set the notification on this auction!");
}
else{
	rs=st.executeQuery("select * from auction where AuctionID = '"+AuctionID+"'");
	if(!rs.next()){
		out.println("Invalid Auction ID");
	}else{
		String s="Currently Unavailable";
		st.executeUpdate("insert into likes values('"+AuctionID+"','"+rs.getString(4)+"','"+rs.getString(5)+"','"+s+"','"+name+"', null)");
		rs=st.executeQuery("select * from account where uid = '"+name+"'");
		if(rs.next())
		st.executeUpdate("update likes set customerEmail ='"+rs.getString(3)+"' where customerID = '"+name+"'");
		out.println("You have successfully set up the notificaion!");
	}
}
%>

<a href ="success.jsp"> Return to home </a>
</body>
</html>