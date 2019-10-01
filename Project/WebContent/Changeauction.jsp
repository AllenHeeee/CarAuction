<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%
int AuctionID=Integer.parseInt(request.getParameter("AuctionID"));
int CurrentBid=Integer.parseInt(request.getParameter("CurrentBid"));
int MinimumIncrement=Integer.parseInt(request.getParameter("MinimumIncrement"));
String delete = request.getParameter("delete");


Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con =DriverManager.getConnection("jdbc:mysql://rucs336g33.c1g6evsz5qrw.us-east-2.rds.amazonaws.com:3306/user","cs336g33","mypassword");
Statement st=con.createStatement();



if(delete.compareTo("yes")==0){
	
	st.executeUpdate("delete from auction where AuctionID='"+AuctionID+"'");
	%>
	<h1>Successfully deleted</h1><br/>
	<a id="Link" href ="success.jsp">return to home</a><br/>
	<%
}
else{
	ResultSet rs=st.executeQuery("select * from auction where AuctionID = '"+AuctionID+"'");
	if(rs.next()){
		int i=st.executeUpdate("update auction set CurrentBid='"+CurrentBid+"',  MinimumIncrement ='"+MinimumIncrement+"'where AuctionID = '"+AuctionID+"'");
		%>
		<h1>Successfully updated</h1>
		<a id="Link" href ="success.jsp">return to home</a><br/>
		<% 
	}
}
%>

</body>
</html>