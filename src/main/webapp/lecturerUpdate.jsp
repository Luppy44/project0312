<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#form-add{
		width:60%;	
		white-space: nowrap;
	}
	#tab-add{
		white-space: nowrap;
		width:100%; 
		border: 2px solid black;
		border-collapse: collapse;
	}
	#tab-add th{
		width:20%;
		height:2em;
		border: 1px solid black;
		background-color: #cacaca;	
	}
	#tab-add td{
		width:80%;
		height:2em;
		border: 1px solid black;
	}
	#idx, #name, #major, #field{
		margin-left:10px;
		width:250px;
		height:20px;
	}
	#button{
		text-align:center;
		
	}
	#button td input{
		background-color: #656565;
		color:white; 
		width:100px;
		height:25px;
	}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<%@ include file="dbconn.jsp" %>
<% 
	String idx=request.getParameter("idx");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try{
		String sql="select * from lecturer0321 where idx=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, idx);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String name=rs.getString("name");
			String major=rs.getString("major");
			String field=rs.getString("field");				
%>

%>
<h2>강사 수정</h2>
<form name="form" method="post" action="lecturerUpdateProcess.jsp" id="form-add">
<table id="tab-add">
    <tr>
      <th>강사 ID</th>
      <td>
      	<input type="text" name="idx" id="idx" value="<%=idx%>">
      </td>
    </tr>
    
    <tr>
      <th>강 사 명</th>
      <td>
      	<input type="text" name="name" id="name" value="<%=name%>">
      </td>
    </tr>
    
    <tr>
      <th>전 공</th>
      <td>
      	<input type="text" name="major" id="major" value="<%=major%>">
      </td>
    </tr>
    
    <tr>
      <th>세부 전공</th>
      <td>
      	<input type="text" name="field" id="field" value="<%=field%>">
      </td>
    </tr>
    
    <tr id="button">
      <td colspan="2">
	      <input type="button" value="목록" onclick="togo()">
	      <input type="button" value="등록" onclick="check()">
      </td>
    </tr>
<%
	} 
	}catch(Exception e){
		e.printStackTrace();
	}
%>
  </table>
</form>
</section>
<%@ include file="footer.jsp" %>
<script>
	function togo(){
		location.href="lecturerList.jsp"
	}
	function check(){
		if(document.form.idx.value==""){
			alert("강사ID가 입력되지 않았습니다!");
			document.form.idx.focus();
			return false;
		}
		if(document.form.name.value==""){
			alert("강사명이 입력되지 않았습니다!");
			document.form.name.focus();
			return false;
		}
		if(document.form.major.value==""){
			alert("전공이 입력되지 않았습니다!");
			document.form.major.focus();
			return false;
		}
		if(document.form.field.value==""){
			alert("세부 전공이 입력되지 않았습니다!");
			document.form.field.focus();
			return false;
		}
		
		document.form.submit();
	}
</script>
</body>
</html>