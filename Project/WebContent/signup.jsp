<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./style.css" />
<title>Sign Up</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%
String userid=request.getParameter("uid");
String pwd=request.getParameter("pwd");
String repwd=request.getParameter("pwd2");
String email=request.getParameter("email");
if(!pwd.equals(repwd)){
	out.println("Inconsist Password!");
	%><br/><%
}else{
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con =DriverManager.getConnection("jdbc:mysql://rucs336g33.c1g6evsz5qrw.us-east-2.rds.amazonaws.com:3306/user","cs336g33","mypassword");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from account where uid='"+userid+"'");
	if(rs.next()){
		out.println("Error! "+userid+" exist!");
	}else{
		int i=st.executeUpdate("insert into account values('"+userid+"','"+pwd+"','"+email+"' )");
		out.println("Success "+userid);
	}
}
%>
<a href ="login.html">Login</a><br/>
<a href="index.html">Home</a>
</body>
</html>