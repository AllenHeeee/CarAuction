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
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://rucs336g33.c1g6evsz5qrw.us-east-2.rds.amazonaws.com:3306/user",
		"cs336g33","mypassword");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from question where Answer = 'NOT ANSWERED'");
if(!rs.next()){
	out.println("No question is not answered");
}
else{
%>
<h2>Search Result</h2>
<table>
<tr>
<td>Question ID</td><td>Auction ID</td><td>Questioner</td><td>Question</td><td>Answer</td>
</tr>
<% 

	rs=st.executeQuery("select * from question where Answer = 'NOT ANSWERED'");
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
<h3>Post new question</h3>
<input type="text" name ="AuctionID" placeholder="Auction ID"/>
<input type="text" name="question" placeholder="Question"/>
<input type="submit" value="Post"/>
</form>
<form class="Answer" action="answer.jsp" method="post">
<h3>Answer a question</h3>
<input type="text" name ="QuestionID" placeholder="Question ID"/>
<input type="text" name="answer" placeholder="Answer"/>
<input type="submit" value="Post"/>
</form>
<a href ="success.jsp"> Return to home </a>
</body>
</html>