<%@page import= "DBPKG.Util" %>    
<%@page import= "java.sql.Connection" %>
<%@page import= "java.sql.Statement" %>
<%@page import= "java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> reservation </title>
</head>
<body>
<jsp:include page= "header.jsp"></jsp:include>

<section style = "position: fixed ; top: 60px ; width: 100%; height: 100% ;
background-color: lightgray ; color: black ; line-height: 20px ; 
font-size: 20px ; padding-left: 20px ">

<h2 style = "text-align:center"> <b> 회원예약조회 </b>
</h2><br>

<form style = "display: flex; align-items: center; justify-content: center;
text -align: center">

<table border ="1">

<tr>
<td> 예약번호 </td>
<td> 고객번호 </td>
<td> 고객이름 </td>
<td> 여행지이름 </td>
</tr>

<%

Connection conn = null;
Statement stmt = null;
String grade = "";

try {
	conn = Util.getConnection();
	stmt = conn.createStatement();
	String sql = 
			"select rs.Reservation_No, cs.Customer_ID, cs.Customer_Name, tr.place from reservation rs, customer cs, travel tr, Payment py where py.Customer_ID=cs.Customer_ID order by Customer_ID asc;";
	
	ResultSet rs = stmt.executeQuery(sql);
	while ( rs.next() ) {
	}

%>

<tr>

<td> <%= rs.getString("Reservation_No") %> </td>
<td> <%= rs.getString("Customer_ID") %> </td>
<td> <%= rs.getString("Customer_Name") %> </td>
<td> <%= rs.getString("place") %> </td>

</tr>


<%
	
}

catch(Exception e) {
	e.printStackTrace();
	}

%>

</table>

</form>


</section>
<jsp:include page="footer.jsp"/>

</body>
</html>