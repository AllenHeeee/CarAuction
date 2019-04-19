<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send Email</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%
String oldName=request.getParameter("olduname");//get the target user to be alerted
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://rucs336g33.c1g6evsz5qrw.us-east-2.rds.amazonaws.com:3306/user",
		"cs336g33","mypassword");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select email from account where name = '"+oldName+"'");
String email=rs.getString(1);

%>
	
</body>
</html>