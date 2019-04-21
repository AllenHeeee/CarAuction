<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./styleHome.css" /> 
<title>Search Result</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%
String QuestionerID=request.getParameter("Questioner");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://rucs336g33.c1g6evsz5qrw.us-east-2.rds.amazonaws.com:3306/user",
		"cs336g33","mypassword");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from question where QuestionerID = '"+QuestionerID+"'");
if(!rs.next()){
%>
<script>alert("This Questioner does not exist or NO question relates to this Questioner!");</script>
<%
}
else{
%>
<h2 id="SearchTitle">Search Result</h2>
<table>
<tr>
<td>Question ID</td><td>Auction ID</td><td>Questioner</td><td>Question</td><td>Answer</td>
</tr>
<% 

	rs=st.executeQuery("select * from question where QuestionerID = '"+QuestionerID+"'");
	while(rs.next()){ 
	out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+
	"</td><td>"+rs.getString(3)+
	"</td><td>"+rs.getString(4)+
	"</td><td>"+rs.getString(5)+
	"</td></tr>");
	}	
}
%>
</table>
<form class="newQuestion" action="question.jsp" method="post">
<h3 style=" margin-left: 80px;">Post new question</h3>
<input type="text" name ="AuctionID" placeholder="Auction ID" required/>
<input type="text" name="question" placeholder="Question" required/>
<input type="submit" value="Post"/>
</form>
<form class="Answer" action="answer.jsp" method="post">
<h3 style=" margin-right: 130px;">Answer a question</h3>
<input type="text" name ="QuestionID" placeholder="Question ID" required/>
<input type="text" name="answer" placeholder="Answer" required/>
<input type="submit" value="Post"/>
</form>
<form class="returnButton">
<a id="Return" href ="success.jsp"> Return to home </a>
</form>
</body>
</html>