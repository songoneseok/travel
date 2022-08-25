
<%@ page import= "java.text.*" %>
<%@ page import= "java.sql.*" %> 
<%@ page import= "DBPKG.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>action</title>
</head>
<body>

	<%
	
	Connection conn = null;
	Statement stmt = null ;
	
	String mode = request.getParameter ("mode") ;
	String Customer_ID = request.getParameter ("Customer_ID");
	String Customer_Name = request.getParameter ("Customer_Name");
	String Customer_Address = request.getParameter ("Customer_Address");
	String Customer_Tel = request.getParameter ("Customer_Tel");
	String Customer_SEX = request.getParameter ("Customer_SEX");
	String Customer_Birth = request.getParameter ("Customer_Birth");
	
	
	
	try {
		conn = Util.getConnection(); 
		stmt = conn.createStatement();
		String sql = "" ; 
		
	
		switch ( mode ) {
		
		case "insert" : 
			sql = "insert into Customer values( " + Customer_ID + " , " + 
					" '" + Customer_Name + "' ," +
					" '" + Customer_Address + "', " +
					" '" + Customer_Tel + "', " +
					" '" + Customer_SEX + "', " +
					" '" + Customer_Birth + "' ) " ;
			stmt.executeUpdate ( sql );
			
			%>
			<jsp:forward page="join.jsp"></jsp:forward>
			<%
			
			break ; 
			
			
			
			
		case "modify" :
			sql = "update Customer set " + 
					" Customer_Name = '" + Customer_Name + "' , " +
					" Customer_Address = '" + Customer_Address + "', " +
					" Customer_Tel = '" + Customer_Tel + "', " +
					" Customer_SEX = '" + Customer_SEX + "' " +
					" Customer_SEX = '" + Customer_Birth + "' " +
					" where Customer_ID = " + Customer_ID ; 
			stmt.executeUpdate ( sql );
			%>
			<jsp:forward page="modify.jsp"></jsp:forward>
			<%
			break ; 
		}
		
	}
	
	catch ( Exception e) {
		e.printStackTrace();
	}
	
	
	%>



</body>
</html>