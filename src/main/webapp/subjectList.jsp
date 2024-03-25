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
	String sql="select count(*) from sub0321";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	int cnt=0;
	if(rs.next()){
		cnt=rs.getInt(1);
	}
%>
<h2>교과목 조회</h2>
<form id="form-add">
<p># 총<%=cnt %> 개의 교과목이 있습니다.<p>
<table border="1" id="tab-list">
	<tr>
		<th>no</th>
		<th>과목코드</th>
		<th>과목명</th>
		<th>학점</th>
		<th>담당강사</th>
		<th>요일</th>
		<th>시작시간</th>
		<th>종료시간</th>
		<th>관리</th>				
	</tr>
<%
	sql="select id,subject_name,credit,name,week,start_hour,end_hour from sub0321 a, lecturer0321 b where a.lecturer=b.idx";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	int number=0;
	while(rs.next()){
		String id=rs.getString("id");
		String subject_name=rs.getString("subject_name");
		String credit=rs.getString("credit");
		String name=rs.getString("name");
		String week=rs.getString("week");
			if(week.equals("1")){
				week="월";
			}
			if(week.equals("2")){
				week="화";
			}
			if(week.equals("3")){
				week="수";
			}
			if(week.equals("4")){
				week="목";
			}
			if(week.equals("5")){
				week="금";
			}
			if(week.equals("6")){
				week="토";
			}
		String start_hour=rs.getString("start_hour");
		String end_hour=rs.getString("end_hour");
		number++;
%>
	<tr>
		<td><%=number %></td>
		<td><%=id %></td>
		<td><%=subject_name %></td>
		<td><%=credit %></td>
		<td><%=name %></td>
		<td><%=week %></td>
		<td><%=start_hour %></td>
		<td><%=end_hour %></td>
		<td><a href="subjectUpdate.jsp?id=<%=id %>">수정</a> /
			<a href="subjectDelete.jsp?id=<%=id %>"
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
 location.href="addSubject.jsp";	
}
</script>
</body>
</html>