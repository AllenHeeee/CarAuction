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
<%//ze cui part start
    if ((session.getAttribute("username") == null)) {
%>
You are not logged in<br/>
<a href="index.html">Please Login</a>
<%} else {
	String usertype =session.getAttribute("usertype").toString();
%>
<form class="Welcome">
<h1>Welcome <%=session.getAttribute("username")%></h1>

<%//-------------------------------------------Admin--------------------------------------------------- %>
<%if(usertype.equals("admin")) {
		%>
		<a href="signupcr.html">Sign Up A New CR Account</a>
		</br>
		<a href="salesreport.jsp">Generate Sales Report</a></br>
		<% 
	}%>
<%//-------------------------------------------Customer Representive----------------------------------- %>	
<%if(usertype.equals("cr")) {
		%>
		<a href="Changeuserinfo.html">Update user information</a>
		</br>
		<a href="Changeaution.html">Update auction information </a></br>
		<% 
	}%>
	
<a href='logout.jsp'>Log out</a><br/>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
</form>

<%//ze cui ends 

//hanqing zhao starts
%>

<h2 id="GQ">Search Auction</h2>
<form class="search" action="search.jsp" method="post" >
<select name="brand">
 <option value = "Acura">Acura</option>
 <option value = "Alfa Romeo">Alfa Romeo</option>
 <option value = "Am General">Am General</option>
 <option value = "Audi">Audi</option>
 <option value = "Bentley">Bentley</option>
 <option value = "BMW">BMW</option>
 <option value = "Buick">Buick</option>
 <option value = "Cadillac">Cadillac</option>
 <option value = "Chevrolet">Chevrolet</option>
 <option value = "Dodge">Dodge</option>
 <option value = "FIAT">FIAT</option>
  <option value = "Ford">Ford</option>
 <option value = "Lexus">Lexus</option>
 <option value = "Mazda">Mazda</option>
 <option value = "McLaren">McLaren</option>
 <option value = "Mercedes-Benz">Mercedes-Benz</option>
 <option value = "MINI">MINI</option>
 <option value = "Nissan">Nissan</option>
 <option value = "Porsche">Porsche</option>
 <option value = "RAM">RAM</option>
</select>
<select name="year">
<option value = "2019">2019</option>
<option value = "2018">2018</option>
<option value = "2017">2017</option>
<option value = "2016">2016</option>
<option value = "2015">2015</option>
<option value = "2014">2014</option>
<option value = "2013">2013</option>
<option value = "2012">2012</option>
<option value = "2011">2011</option>
<option value = "2010">2010</option>
</select>
<select name="type">
<option value = "SUV">SUV</option>
<option value = "Sedan">Sedan</option>
<option value = "Sport">Sport</option>
<option value = "Van">Van</option>
<option value = "Coupe">Coupe</option>
<option value = "Hatchback">Hatchback</option>
<option value = "Wagon">Wagon</option>
</select>
<select name = "condition">
<option value = "new">new</option>
<option value = "used">used</option>
<option value = "certified">certified</option>
</select>
   <input type="submit" value="Search"/>
</form>

<% 
//hanqing zhao ends
//junjie he starts
%>

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
	boolean alerted=false;
	while(rs.next()){
		if(rs.getString(7)==null){
			continue;
		}
		%>
		<script>
		alert("Dear Customer, Your Upper Limit was surpassed!\tYou can increase your Upper Limit of bid or just give up.");
		</script>
		<% 
		alerted=true;
		break;
	}
	if(!alerted){
		%>
		<script>
		alert("Dear Customer, You are out of bid!\nYou can increase your bid or just give up.");
		</script>
		<% 
	}
		%>
	

	<h2 id="GQ">Alert Message</h2>
	<table>
	<tr>
	<td>Auction ID</td><td>Car Brand</td><td>Year</td><td>Current Bid</td><td>Status</td>
	</tr>
	<%
	rs=st.executeQuery("select * from Alert where oldBidder = '"+name+"'");
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
<h2 id="GQ">General Questions</h2>
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

<%/*
<form action="searchtmp.jsp" method="post">
<h2 id="SearchTitle">Search questions</h2>
search by
<select name="searchas">
<option value="keyword">keyword</option>
<option value="auctionID">auctionID</option>
<option value="questioner">questioner</option>
</select>
<input type="text" name="searchkey"  required />
<input type="submit" value="submit"/>
</form>
*/%>



<div class="block2">
<form action="SearchQuestionbyKeyWord.jsp" method="post">
<h3 >By KeyWord</h3>
<input type="text" name ="Keyword" placeholder="Keyword"/>
<input type="submit" value="Search"/>
</form>
</div>

<div class="block1">
<form  action="SearchQuestion.jsp" method="post">
<h3>By Auction</h3>
<input type="text" name ="AuctionID" placeholder="Auction ID" required/>
<input type="submit" value="Search"/>
</form>
</div>

<div class="block3">
<form action="SearchQuestionbyQuestioner.jsp" method="post">
<h3>By Questioner</h3>
<input type="text" name ="Questioner" placeholder="Questioner ID" required/>
<input type="submit" value="Search"/>
</form>
</div>


<form class="SearchQuestionbyNOTAnswered" action="SearchQuestionbyNOTAnswered.jsp" method="post">
<h3>Show not answered questions</h3>
<input type="submit" value="Show"/>
</form>

<form class="newQuestion" action="question.jsp" method="post">
<h3>Post a new question</h3>
<input type="text" name ="AuctionID" placeholder="Auction ID" required/>
<input type="text" name="question" placeholder="Question" required/>
<input type="submit" value="Post"/>
</form>



<% 
rs=st.executeQuery("select * from cr where uid = '"+name+"'");
if(rs.next()){
%>
<form class="Answer" action="answer.jsp" method="post">
<h3>Answer a question</h3>
<input type="text" name ="QuestionID" placeholder="Question ID" required/>
<input type="text" name="answer" placeholder="Answer" required/>
<input type="submit" value="Answer"/>
</form>
<% }%>
<% 
rs=st.executeQuery("select * from likes where customerID = '"+name+"' and status = 'Available'");
if(rs.next()){
	%> 
	<h2 id="GQ">New Available Notification</h2>
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
<h3>Set Notification for your favorites cars.</h3>
<input type="text" name ="AuctionID" placeholder="Auction ID" required/>
<input type="submit" value="likes!"/>
</form>

<%
    }
%>

<div class="Welcome">
<h1>Welcome to the Violence Gentleman Club</h1>
<a href='logout.jsp'>Log out</a><br/>
</div>


</body>
</html>