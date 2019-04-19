<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%
int QuestionID=Integer.parseInt(request.getParameter("QuestionID"));
String Answer=request.getParameter("answer");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con =DriverManager.getConnection("jdbc:mysql://rucs336g33.c1g6evsz5qrw.us-east-2.rds.amazonaws.com:3306/user","cs336g33","mypassword");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from question where QuestionID = '"+QuestionID+"'");
if(!rs.next()){
	out.println("Please enter a valid Question ID!");
}else{
	st.executeUpdate("update question set Answer = '"+Answer+"' where QuestionID = '"+QuestionID+"'");
	%>
	<h1>You have successfully answered a new question</h1>
	<% 
}

%>

<a href ="success.jsp"> Return to home </a>
</body>
</html>