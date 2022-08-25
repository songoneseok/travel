<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.text.*" %>
<%@ page import= "java.sql.*" %> 
<%@ page import= "DBPKG.Util" %>    
<%@ page import= "java.text.SimpleDateFormat" %>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify</title>
</head>
<body>
	<script type="text/javascript" src="check.js"></script>
	

	<jsp:include page="header.jsp"></jsp:include>
	<section style = " position: fixed; top: 60px; width: 100% ; height: 100% ;
	background-color: lightgray ; color: black ; line-height: 20px ; font-size: 15px ; 
	padding-left: 20px">
	<h2 style = "text-align: center"><b>고객 정보수정</b></h2><br>
	
	
	<form method = "post" action = "action.jsp" name="frm" style = "display: flex; align-items: center; 
	justify-content: center ; text-align: center">
	
	<input type = "hidden" name = "mode" value = "modify">
	
	<table border="1">
	
	
	<%
	
	Connection conn = null;
	Statement stmt = null ; 
	String mod_Customer_ID = request.getParameter("mod_Customer_ID") ;
	String Customer_Name = "";
	String Customer_Address = "";
	String Customer_Tel = "";
	String Customer_SEX = "";
	String Customer_Birth = "";

	
	try {
		conn = Util.getConnection(); 
		stmt = conn.createStatement();
		String sql = "select * from Customer Where Customer_ID = " + mod_Customer_ID ; 
		ResultSet rs = stmt.executeQuery(sql);
		rs.next() ; 
		mod_Customer_ID = rs.getString("Customer_ID");
		Customer_Name = rs.getString("Customer_Name");
		Customer_Address = rs.getString("Customer_Address");
		Customer_Tel = rs.getString("Customer_Tel");

		Customer_SEX = rs.getString("Customer_SEX");		
		Customer_Birth = rs.getString("Customer_Birth");}

//		SimpleDateFormat transFormat = new SimpleDateFormat("YYYY-MM-dd") ;
//			joindateStr = transFormat.format(joindate); 
//}
	
	catch(Exception e){
		e.printStackTrace();
	}
	
	%>
	
	<tr>
	<td>고객번호</td>
	<td><input type = "text" name= "Customer_ID" value= "<%=mod_Customer_ID %>"></td>
	</tr>
	
		<tr>
	<td>고객성명 </td>
	<td><input type = "text" name= "Customer_Name" value= "<%=Customer_Name %>"></td>
	</tr>
	
		<tr>
	<td>주소</td>
	<td><input type = "text" name= "Customer_Address" value= "<%=Customer_Address %>"></td>
	</tr>
	
		<tr>
	<td>전화번호</td>
	<td><input type = "text" name= "Customer_Tel" value= "<%=Customer_Tel %>"></td>
	</tr>
	
		<tr>
	<td>고객성별 </td>
	<td><input type = "text" name= "Customer_SEX" value= "<%=Customer_SEX %>"></td>
	</tr>
	
	
		<tr>
	<td>고객생년월일 </td>
	<td><input type = "text" name= "Customer_Birth" value= "<%=Customer_Birth %>"></td>
	</tr>
	

	
	<tr>
		<td COLSPAN="2">
		<input type = "SUBMIT" value="수정" onclick="return modify()"> &nbsp;
		<input type = "button" value="조회" onclick="return searchCheck()">
		</td>
	</tr>
	
	  
	  
	  
	</table>
	</form>
	</section>
	<jsp:include page ="footer.jsp"></jsp:include>

</body>
</html>