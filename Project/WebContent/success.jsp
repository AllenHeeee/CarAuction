<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./styleHome.css" /> 
<title>Home</title>
</head>
<body>


<%
    if ((session.getAttribute("username") == null)) {
%>
You are not logged in<br/>
<a href="index.html">Please Login</a>
<%} else {
%>
<form class="Welcome">
<h1>Welcome <%=session.getAttribute("username")%></h1><a href='logout.jsp'>Log out</a><br/>
<%if(session.getAttribute("username").equals("001")||session.getAttribute("username").equals("002")
||session.getAttribute("username").equals("003")||session.getAttribute("username").equals("004")) {
		%>
		<a href="signupcr.html">sign up a new cr</a>
		
		<% 
	}%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
</form>
<form class="ConnectDB">
<%
String name=session.getAttribute("username").toString();
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://rucs336g33.c1g6evsz5qrw.us-east-2.rds.amazonaws.com:3306/user",
		"cs336g33","mypassword");
Statement st=con.createStatement();
Statement st2=con.createStatement();

%>
</form>
<form class="Alert">
<%
ResultSet rs=st.executeQuery("select * from Alert where oldBidder = '"+name+"'");
if(rs.next()){
	rs=st.executeQuery("select * from Alert where oldBidder = '"+name+"'");
	%>
	<script>
	alert("Dear Customer, You are out of bid!\nYou can increase your bid or just give up.");
	</script>
	<h2>Alert Message</h2>
	<table>
	<tr>
	<td>Auction ID</td><td>Car Brand</td><td>Year</td><td>Current Bid</td><td>Status</td>
	</tr>
	<%
	while(rs.next()){ 
		out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+
		"</td><td>"+rs.getString(3)+
		"</td><td>"+rs.getString(4)+
		"</td><td> You are out of Bid </td></tr>");
		}
	%>
	</table>
	<% 
	st.executeUpdate("delete from Alert where oldBidder = '"+name+"'");
}
ResultSet rs2=st2.executeQuery("select * from question");
%>
<h2>General Questions</h2>
<table>
<tr>
<td>Question ID</td><td>Auction ID</td><td>Questioner</td><td>Question</td><td>Answer</td>
</tr>
<% 
while(rs2.next()){ 
out.println("<tr><td>"+rs2.getString(1)+"</td><td>"+rs2.getString(2)+
"</td><td>"+rs2.getString(3)+
"</td><td>"+rs2.getString(4)+
"</td><td>"+rs2.getString(5)+
"</td></tr>");
}
%>
</table>
</form>
<form class="SearchQuestionbyKeyWord" action="SearchQuestionbyKeyWord.jsp" method="post">
<h3>Search a question by Keyword</h3>
<input type="text" name ="Keyword" placeholder="Keyword"/>
<input type="submit" value="Search"/>
</form>
<form class="SearchQuestion" action="SearchQuestion.jsp" method="post">
<h3>Search a question by Auction</h3>
<input type="text" name ="AuctionID" placeholder="Auction ID"/>
<input type="submit" value="Search"/>
</form>
<form class="SearchQuestionbyQuestioner" action="SearchQuestionbyQuestioner.jsp" method="post">
<h3>Search a question by Questioner</h3>
<input type="text" name ="Questioner" placeholder="Questioner ID"/>
<input type="submit" value="Search"/>
</form>
<form class="SearchQuestionbyNOTAnswered" action="SearchQuestionbyNOTAnswered.jsp" method="post">
<h3>Show all questions that are not answered</h3>
<input type="submit" value="Show"/>
</form>
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
<input type="submit" value="Answer"/>
</form>
<% 
rs=st.executeQuery("select * from likes where customerID = '"+name+"' and status = 'Available'");
if(rs.next()){
	%> 
	<h2>New Available Notification</h2>
	<script>
	alert("New auction that you are interested in is available!")
	</script>
	<table>
	<tr>
	<td>Auction ID</td><td>Brand</td><td>Year</td><td>Status</td>
	</tr>
	<%
	do{
		out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+
				"</td><td>"+rs.getString(3)+
				"</td><td>"+rs.getString(4)+
				"</td></tr>");
	}while(rs.next());
	st.executeUpdate("delete from likes where customerID = '"+name+"' and status = 'Available'");
	%>
	</table>
	<%
}
%>
<form class="likes" action="likes.jsp" method="post">
<h3>Set Notification for your favorites cars.</h3><h4>(You will be notified if cars you choose become available)</h4> 
<input type="text" name ="AuctionID" placeholder="Auction ID"/>
<input type="submit" value="likes!"/>
</form>

<%
    }
%>
</body>
</html>