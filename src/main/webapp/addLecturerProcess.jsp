<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String idx=request.getParameter("idx");
	String name=request.getParameter("name");
	String major=request.getParameter("major");
	String field=request.getParameter("field");
	
	try{
		String sql="insert into lecturer0321 values(?,?,?,?)";
		PreparedStatement pstmt=null;
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, idx);
		pstmt.setString(2, name);
		pstmt.setString(3, major);
		pstmt.setString(4, field);
		pstmt.executeUpdate();		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<script>
	alert("등록이 완료되었습니다.");
	location.href="lecturerList.jsp";
</script>
</body>
</html>