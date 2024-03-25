<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#form-add{
		width:90%;	
		white-space: nowrap;
	}
	#tab-list{
		width:100%; 
		border: 2px solid black;
		border-collapse: collapse;
		text-align:center;
		white-space: nowrap;
	}
	#tab-list th{
		background-color: #cacaca;
		height: 30px;
	}
	#numb{
		font-weight: bold;
	}
	#button{
		background-color: #656565;
		margin-top: 10px;
		color:white; 
		width:100px;
		height:25px;
	}
	p{
		font-weight: bold;
		margin-bottom:10px;
	}
</style>
</head>
<body>
<%@ include file="header.jsp" %>	
<%@ include file="nav.jsp" %>
<section>
<%@ include file="dbconn.jsp" %>
<% 
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try{
	String sql="select count(*) from lecturer0321";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	int cnt=0;
	if(rs.next()){
		cnt=rs.getInt(1);
	}
%>
<h2>강사 리스트</h2>
<form id="form-add">
<p># 총<%=cnt %> 명의 강사가 있습니다.<p>
<table border="1" id="tab-list">
	<tr>
		<th>강사코드</th>
		<th>강사명</th>
		<th>전공</th>
		<th>세부전공</th>
		<th>관리</th>				
	</tr>
<%
	sql="select idx,name,major,field from lecturer0321 order by idx";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String idx=rs.getString("idx");
		String name=rs.getString("name");
		String major=rs.getString("major");
		String field=rs.getString("field");
%>
	<tr>
		<td><%=idx %></td>
		<td><%=name %></td>
		<td><%=major %></td>
		<td><%=field %></td>
		<td><a href="lecturerUpdate.jsp?idx=<%=idx %>">수정</a> /
			<a href="lecturerDelete.jsp?idx=<%=idx %>"
			onclick="if(!confirm('정말로 삭제하겠습니까?')) return false;">삭제</a></td>
	</tr>
<%
	}
	}catch(Exception e){
		e.printStackTrace();
	}
%>	
</table>
</form>
	<input type="button" value="작성" id="button" onclick="add()">
</section>	
<%@ include file="footer.jsp" %>
<script>
function add(){
 location.href="addLecturer.jsp";	
}
</script>
</body>
</html>