<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--<jsp:include page="header.jsp"></jsp:include>-->
<section style="position: fixed; top: 60px; width: 100%; height: 100%; background-color: lightgray; color: white; line-height: 20px; font-size: 10px; padding-left: 20px">
<h2 style="text-align: center"><b>고객목록조회/수정</b></h2><br>

<form style="display: flex; align-terms: center; justify-content: center; text-align: center">
<table border="1">
<tr>
		<td> 고객번호 </td>
		<td> 고객성명 </td>
		<td> 주소 </td>
		<td> 전화번호 </td>
		<td> 고객성별 </td>
		<td> 고객생년월일 </td>
	</tr>
	<%
	
	Connection conn = null;
	Statement stmt = null;
	String grade = "";
	
	try {
		conn = Util.getConnection();
		stmt = conn.createStatement();
		String sql = "select * from Customer order by Customer_ID asc";
		
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
	
	%>
	
	<tr>
	
	<td><a href = "modify.jsp?mod_Customer_ID=<%= rs.getString("Customer_ID") %>"><%= rs.getString("Customer_ID") %></a> </td>
	<td><%= rs.getString("Customer_Name") %> </td>
	<td><%= rs.getString("Customer_Address") %> </td>
	<td><%= rs.getString("Customer_Tel") %> </td>
	<td><%= rs.getString("Customer_SEX") %> </td>
	<td><%= rs.getString("Customer_Birth") %> </td>
	
	</tr>
<%
	}
}
catch(Exception e) {
	e.printStackTrace();
}
%>

</table>
</form>

</section>
<!--<jsp:include page="footer.jsp"></jsp:include>-->
</body>
</html>