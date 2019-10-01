<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./stylelogin.css" /> 
<title>Salesreport</title>
</head>


<body>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<% 

Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con =DriverManager.getConnection("jdbc:mysql://rucs336g33.c1g6evsz5qrw.us-east-2.rds.amazonaws.com:3306/user","cs336g33","mypassword");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select sum(CurrentBid) from auction where WinnerName is not Null ");
int turnover;
double totalearning;
int i=0;
while(rs.next()&&i==0){ 
	turnover = Integer.parseInt(rs.getString(1));
	totalearning = (turnover*0.02);
	%><table>
	<p1>As an intermediary， we do not interfere during the process or the result of the auctions. we profit only 2% service fee on each deal.<p1/>
	<tr>The total turnover is:<%out.println(turnover) ;%></tr>
	<tr>The total earning is:<%out.println(totalearning); %></tr>
	</table>
	<%
	i++;
	}	
%>
<br/>

<% 
%>
<br/>
<% 
i=0;
String bsellingmodel;
ResultSet he=st.executeQuery("SELECT model, count( * ) AS count  FROM auction where WinnerName is not NUll GROUP BY model ORDER BY count DESC");  
while(he.next()&&i==0){ 
	bsellingmodel=he.getString(1);
	%><table>
	<tr>The best-selling model is:<%out.println(bsellingmodel) ;%></tr>
	</table>
	<%
	i++;
	}	
%>
<br/>
<% 
String bsellingbrand;
i=0;
ResultSet hr=st.executeQuery("SELECT Brand, count( * ) AS count  FROM auction where WinnerName is not NUll GROUP BY Brand ORDER BY count DESC");  
while(hr.next()&&i==0){ 
	bsellingbrand=hr.getString(1);
	%><table>
	<tr>The best-selling brand is:<%out.println(bsellingbrand) ;%></tr>
	</table>
	<% 
	i++;
	}
%>
<br/>
<% 
String bbuyer;
i=0;
ResultSet hq=st.executeQuery("SELECT WinnerName, count( * ) AS count  FROM auction where WinnerName is not NUll GROUP BY WinnerName ORDER BY count DESC");  
while(hq.next()&&i==0){ 
	bbuyer=hq.getString(1);
	%>
	<table>
	<tr>The best buyer is:<%out.println(bbuyer) ;%></tr>
	</table>
	<% 
	i++;
	}

%>
<br/>
<%
String bcartype;
i=0;
ResultSet ht=st.executeQuery("SELECT Type, count( * ) AS count  FROM auction where WinnerName is not NUll GROUP BY Type ORDER BY count DESC");  
while(ht.next()&&i==0){ 
	bcartype=ht.getString(1);
	%>
	<table>
	<tr>The best-selling car type is:<%out.println(bcartype) ;%></tr>
	</table>
	<%
	i++;
	}
%>


<br/>



</body>
</html>