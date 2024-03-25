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
	PreparedStatement pstmt=null;
	String idx=request.getParameter("idx");
	String name=request.getParameter("name");
	String major=request.getParameter("major");
	String field=request.getParameter("field");
	
	try{
		String sql="update lecturer0321 set name=?,major=?,field=? where idx=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, major);
		pstmt.setString(3, field);
		pstmt.setString(4, idx);
		
		pstmt.executeUpdate();		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<script>
	alert("수정이 완료되었습니다.");
	location.href="lecturerList.jsp";
</script>
</body>
</html>