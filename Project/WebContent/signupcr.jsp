<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%
String userid=request.getParameter("uid");
String pwd=request.getParameter("pwd");
String repwd=request.getParameter("pwd2");
String email=request.getParameter("email");
String phonenum= request.getParameter("phonenum");
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
		int i=st.executeUpdate("insert into cr values('"+userid+"','"+phonenum+"','"+email+"','"+pwd+"' )");
		out.println("A new cr "+userid+" is signed in.");
	}

}
%>
<a href="Home.jsp">Home</a>
</body>
</html>