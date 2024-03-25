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
	PreparedStatement pstmt=null;
	String studNo=request.getParameter("studNo");
	try{
	String sql="delete from stud0321 where studNo=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, studNo);
	pstmt.executeUpdate();		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<script>
	alert("삭제 성공");
	location.href="studentList.jsp";
</script>
</body>
</html>