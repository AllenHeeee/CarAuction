<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./stylelogin.css" />
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%
String email=request.getParameter("email");
String pwd=request.getParameter("pwd");
String uid=request.getParameter("uid");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con =DriverManager.getConnection("jdbc:mysql://rucs336g33.c1g6evsz5qrw.us-east-2.rds.amazonaws.com:3306/user","cs336g33","mypassword");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from account where uid='"+uid+"'");
if(rs.next()){
	int i=st.executeUpdate("update account set pwd='"+pwd+"',email='"+email+"' where uid='"+uid+"' ");
	out.println("Successful updated "+uid);
}
%>
<a href="index.html">Home</a>
</body>
</html>