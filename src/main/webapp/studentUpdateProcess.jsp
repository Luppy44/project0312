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
	String studNo=request.getParameter("studNo");
	String name=request.getParameter("name");
	String dept=request.getParameter("dept");
	String position=request.getParameter("position");
	String address=request.getParameter("address");
	String phone=request.getParameter("phone");
	String [] hob=request.getParameterValues("hobby");
	String hobby="";
	if(hob !=null){
		for(int i=0;i<hob.length;i++){
			if(i==(hob.length-1)){
				hobby+=hob[i];
			}else{
				hobby+=hob[i]+",";				
			}
		}
	}
	
	try{
		String sql="update stud0321 set name=?,dept=?,position=?,address=?,phone=?,hobby=? where studNo=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, dept);
		pstmt.setString(3, position);
		pstmt.setString(4, address);
		pstmt.setString(5, phone);
		pstmt.setString(6, hobby);
		pstmt.setString(7, studNo);
		
		pstmt.executeUpdate();		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<script>
	alert("수정이 완료되었습니다.");
	location.href="studentList.jsp";
</script>
</body>
</html>