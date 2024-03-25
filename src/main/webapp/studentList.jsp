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
	String sql="select count(*) from stud0321";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	int cnt=0;
	if(rs.next()){
		cnt=rs.getInt(1);
	}
%>
<h2>학사 정보 목록</h2>
<form id="form-add">
<p># 총<%=cnt %> 건의 매출정보가 있습니다.<p>
<table border="1" id="tab-list">
	<tr>
		<th>학번</th>
		<th>성명</th>
		<th>학과</th>
		<th>학년</th>
		<th>주소</th>
		<th>연락처</th>
		<th>취미</th>
		<th>관리</th>				
	</tr>
<%
	sql="select studNo,name,dept,position,address,substr(phone,1,3)||'-'||substr(phone,4,4)||'-'||substr(phone,8,4) as phone,hobby from stud0321";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String studNo=rs.getString("studNo");
		String name=rs.getString("name");
		String dept=rs.getString("dept");
		String position=rs.getString("position");
		String address=rs.getString("address");
		String phone=rs.getString("phone");
		String hobby=rs.getString("hobby");
%>
	<tr>
		<td><%=studNo %></td>
		<td><%=name %></td>
		<td><%=dept %></td>
		<td><%=position %></td>
		<td><%=address %></td>
		<td><%=phone %></td>
		<td><%=hobby %></td>
		<td><a href="studentUpdate.jsp?studNo=<%=studNo %>">수정</a> /
			<a href="studentDelete.jsp?studNo=<%=studNo %>"
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
	<input type="button" value="학사정보 추가" id="button" onclick="add()">
</section>	
<%@ include file="footer.jsp" %>
<script>
function add(){
 location.href="addStudent.jsp";	
}
</script>
</body>
</html>