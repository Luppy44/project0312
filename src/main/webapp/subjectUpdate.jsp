<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#form-add{
		width:80%;	
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
	#id, #subjectName, #credit, #startHour, #endHour{
		margin-left:10px;
		width:200px;
		height:20px;
	}
	#lecturer{
		margin-left:10px;
		width:130px;
		height:23px;
	}
	.week{
		margin-left:10px;
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
	String id=request.getParameter("id");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="";
	try{
		sql="select * from sub0321 where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String subject_name=rs.getString("subject_name");
			String credit=rs.getString("credit");
			String lecturer=rs.getString("lecturer");				
			String week=rs.getString("week");
			String start_hour=rs.getString("start_hour");
			String end_hour=rs.getString("end_hour");
%>
<h2>교과목 수정</h2>
<form name="form" method="post" action="addSubjectProcess.jsp" id="form-add">
<table id="tab-add">
    <tr>
      <th>교과목 코드</th>
      <td>
      	<input type="text" name="id" id="id" value="<%=id%>">
      </td>
    </tr>
    
    <tr>
      <th>과 목 명</th>
      <td>
      	<input type="text" name="subject_name" id="subjectName" value="<%=subject_name%>">
      </td>
    </tr>

    <tr>
      <th>학 점</th>
      <td>
      	<input type="text" name="credit" id="credit" value="<%=credit%>">
      </td>
    </tr>
    
    <tr>
      <th>담 당 강 사</th>
      <td>
		<select name="lecturer" id="lecturer">
			<option value="">담당강사 선택</option>
	
		<%
			sql="select idx,name from lecturer0321";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()){
					String idx=rs.getString("idx");
					String name=rs.getString("name");
			
		%>
			<option value="<%=idx%>" <%if(lecturer.equals(idx)){%>selected<% } %>><%=name %></option>
		<%
				}
		%>
		</select>	
      </td>
    </tr>
    
    <tr>
      <th>요 일</th>
      <td>
      	<input type="radio" name="week" value="1" class="week" <%=week.equals("1")? "checked" :"" %>> 월
		<input type="radio" name="week" value="2" class="week" <%=week.equals("2")? "checked" :"" %>> 화
		<input type="radio" name="week" value="3" class="week" <%=week.equals("3")? "checked" :"" %>> 수
		<input type="radio" name="week" value="4" class="week" <%=week.equals("4")? "checked" :"" %>> 목
		<input type="radio" name="week" value="5" class="week" <%=week.equals("5")? "checked" :"" %>> 금
		<input type="radio" name="week" value="6" class="week" <%=week.equals("6")? "checked" :"" %>> 토
      </td>
    </tr>
    
    <tr>
      <th>시 작</th>
      <td>
      	<input type="text" name="start_hour" id="startHour" value="<%=start_hour%>">
      </td>
    </tr>
    
    <tr>
      <th>종 료</th>
      <td>
      	<input type="text" name="end_hour" id="endHour" value="<%=end_hour%>">
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
		System.out.println("테이블 읽기 오류");
		System.out.println("SQL:"+e.getMessage());
	}
%>
  </table>
</form>
</section>
<%@ include file="footer.jsp" %>
<script>
	function togo(){
		location.href="subjectList.jsp"
	}

	function check(){
		if(document.form.id.value==""){
			alert("교과목 코드가 입력되지 않았습니다!");
			document.form.id.focus();
			return false;
		}
		if(document.form.subject_name.value==""){
			alert("교과목명이 입력되지 않았습니다!");
			document.form.subject_name.focus();
			return false;
		}
		if(document.form.credit.value==""){
			alert("학점이 입력되지 않았습니다!");
			document.form.credit.focus();
			return false;
		}
		if(document.form.lecturer.value==""){
			alert("담당강사가 입력되지 않았습니다!");
			document.form.lecturer.focus();
			return false;
		}
		let cnt=0;
		let rdo=document.getElementsByName("week");
		for(let i=0;i<rdo.length;i++){
			if(rdo[i].checked==true){
				cnt++;
				break;
			}
		}
		if(cnt==0){
			alert("요일이 선택되지 않았습니다!");
			return false;
		}
		if(document.form.start_hour.value==""){
			alert("시작시간이 입력되지 않았습니다!");
			document.form.start_hour.focus();
			return false;
		}
		if(document.form.end_hour.value==""){
			alert("종료시간이 입력되지 않았습니다!");
			document.form.end_hour.focus();
			return false;
		}
		
		document.form.submit();
	}
</script>
</body>
</html>