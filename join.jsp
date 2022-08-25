<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> join </title>
</head>
<body>

<script type="text/javascript" src="check.js"></script>

<jsp:include page ="header.jsp"/>

<%

request.setCharacterEncoding("UTF-8");


Connection conn = null;
Statement stmt = null;
String Customer_ID="";

try {
	conn = Util.getConnection();
	stmt = conn.createStatement();
	String sql = "";
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	Customer_ID = rs.getString("Customer_ID");
}

catch(Exception e) {
	e.printStackTrace();
}

%>


<section style = "position: fixed ; top: 60px ; width: 100%; height: 100% ;
background-color: pink ; color: white ; line-height: 20px ; 
font-size: 20px ; padding-left: 30px ">
<h2 style = "text-align: center"><b> 예약 </b></h2><br>

<form method = "post" action = "action.jsp" name="frm" style = "display: flex; align-items: center;
justify-content: center; text-align: center">
<input type = "hidden" name = "mode" value = "insert" >

<table border = "1">

<tr>
<td> 고객번호 </td>
<td> <input type = "text" name = "Customer_ID" value = "" > </td>
</tr>
<tr>
<td> 고객성명 </td>
<td> <input type = "text" name = "Customer_Name" value = ""> </td>
</tr>
<tr>
<td> 주소 </td>
<td> <input type = "text" name = "Customer_Address" value = ""> </td>
</tr>
<tr>
<td> 전화번호 </td>
<td> <input type = "text" name = "Customer_Tel" value = ""> </td>
</tr>
<tr>
<td> 고객성별 </td>
<td> <input type = "text" name = "Customer_SEX" value = ""> </td>
</tr>
<tr>
<td> 생년월일 </td>
<td> <input type = "text" name = "Customer_Birth" value = ""> </td>
</tr>
<tr>
<td colspan="2">
<input type="submit" value= "등록" onclick="return joinCheck()"> &nbsp;
<input type="button" value= "조회" onclick="return searchCheck()"> 
</td>
</tr>

</table>
</form>

</section>

<jsp:include page="footer.jsp"/>

</body>
