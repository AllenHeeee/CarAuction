<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./styleHome.css" /> 
<title>Question</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%
int AuctionID=Integer.parseInt(request.getParameter("AuctionID"));
String ID=session.getAttribute("username").toString();
String Question=request.getParameter("question");
String Answer="NOT ANSWERED";
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con =DriverManager.getConnection("jdbc:mysql://rucs336g33.c1g6evsz5qrw.us-east-2.rds.amazonaws.com:3306/user","cs336g33","mypassword");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select count(*) from question");
String questionID="-1";
if(rs.next()){
	 questionID=rs.getString(1);
}
int n=Integer.parseInt(questionID);
n++;
ResultSet rs2=st.executeQuery("select * from auction where AuctionID='"+AuctionID+"'");
if(!rs2.next()){
	 out.println("Please enter a valid Auction ID!");
}
else{
	/* rs2=st.executeQuery("select * from question where AuctionID='"+AuctionID+"' and QuestionerID='"+ID+"'");
	if(rs2.next()){
		out.println("You have to wait for your previous question to be answered to post a new question!");
	}else{ */
		st.executeUpdate("insert into question values('"+n+"','"+AuctionID+"','"+ID+"','"+Question+"','"+Answer+"' )");
		%>
		<h1 id="SearchTitle">You have successfully posted a new question</h1>
		<% 
	/* } */
	
}

%>
<form class="returnButton">
<a id="Return" href ="success.jsp"> Return to home </a>
</form>
</body>
</html>