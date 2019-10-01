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
String userid=request.getParameter("uid");
String pwd=request.getParameter("pwd");
String loginas =request.getParameter("loginas");
//out.println("type is:"+loginas);
Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://rucs336g33.c1g6evsz5qrw.us-east-2.rds.amazonaws.com:3306/user",
		"cs336g33","mypassword");
	Statement st=con.createStatement();
if(loginas.compareTo("user")==0){
	
	ResultSet rs=st.executeQuery("select * from account where uid='"+userid+"' and pwd='" + pwd + "'");
	if(rs.next()){
		session.setAttribute("username", userid);
		session.setAttribute("usertype", "user");
		response.sendRedirect("success.jsp");
	}
	else
		out.println("Wrong UserID or Password.<a href ='login.html'> Try again</a><br/><a href ='signup.html'> Sign Up</a>");
}
if(loginas.compareTo("CR")==0){
	ResultSet rs=st.executeQuery("select * from cr where uid='"+userid+"' and pwd='" + pwd + "'");
	if(rs.next()){
		session.setAttribute("username", userid);
		session.setAttribute("usertype", "cr");
		response.sendRedirect("success.jsp");
	}
	else
		out.println("Wrong UserID or Password.<a href ='login.html'> Try again</a><br/><a href ='signup.html'> Sign Up</a>");
}
if(loginas.compareTo("admin")==0){
	ResultSet rs=st.executeQuery("select * from admin where uid='"+userid+"' and password='" + pwd + "'");
	if(rs.next()){
		session.setAttribute("username", userid);
		session.setAttribute("usertype", "admin");
		response.sendRedirect("success.jsp");
	}
	else
		%><h1>Wrong UserID or Password.<h1/>
		<a href ='login.html'> Try again</a><br/><a href ='signup.html'> Sign Up</a>
<% 
}
%>

</body>
</html>