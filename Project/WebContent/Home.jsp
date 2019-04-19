<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>My car auction</p>
<%
out.println(session.getAttribute("username"));

if (session.getAttribute("username") == null){
	 out.println("not login"); 
	%>
	<a href="login.html">login</a>
	<a href ="signup.html">Sign up as user</a><br/><% 
}

else if(session.getAttribute("username")!=null ){ 
	out.println("welcome");
	%><a href="logout.jsp">logout</a>
	<%if(session.getAttribute("username").equals("001")||session.getAttribute("username").equals("002")
||session.getAttribute("username").equals("003")||session.getAttribute("username").equals("004")) {
		%>
		<a href="signupcr.html">sign up a new cr</a>
		
		<% 
	}%>
	other things goes here
	<% 
}
%>

<a href="support.jsp"> support </a>
</body>
</html>