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
	#studNo, #name, #phone{
		margin-left:10px;
		width:200px;
		height:20px;
	}
	#dept{
		margin-left:10px;	
		width:150px;
		height:23px;
	}
	#address{
		margin-left:10px;
		height:20px;
		width:400px;
	}
	.position, .hobby{
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
	String studNo=request.getParameter("studNo");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try{
		String sql="select * from stud0321 where studNo=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, studNo);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String name=rs.getString("name");
			String dept=rs.getString("dept");
			String position=rs.getString("position");				
				String hob=rs.getString("hobby");
			String hobby []=hob.split(",");
			String address=rs.getString("address");
			String phone=rs.getString("phone");
%>
<h2>학사 정보 수정</h2>
<form name="form" method="post" action="studentUpdateProcess.jsp" id="form-add">
<table id="tab-add">
    <tr>
      <th>학번</th>
      <td>
      	<input type="text" name="studNo" id="studNo" value="<%=studNo%>">
      </td>
    </tr>
    
    <tr>
      <th>성명</th>
      <td>
      	<input type="text" name="name" id="name" value="<%=name%>">
      </td>
    </tr>
    
    <tr>
      <th>학과</th>
      <td>
		<select name="dept" id="dept">
			<option value="1" <%if(dept.equals("1")){%>selected<% } %>>컴퓨터공학과</option>
			<option value="2" <%if(dept.equals("2")){%>selected<% } %>>기계공학과</option>
			<option value="3" <%if(dept.equals("3")){%>selected<% } %>>전자과</option>
			<option value="4" <%if(dept.equals("4")){%>selected<% } %>>영문학과</option>
			<option value="5" <%if(dept.equals("5")){%>selected<% } %>>일어과</option>
			<option value="6" <%if(dept.equals("6")){%>selected<% } %>>경영학과</option>
			<option value="7" <%if(dept.equals("7")){%>selected<% } %>>무역학과</option>
			<option value="8" <%if(dept.equals("8")){%>selected<% } %>>교육학과</option>
		</select>	
      </td>
    </tr>
    
    <tr>
      <th>학년</th>
      <td>
      	<input type="radio" name="position" value="1" class="position" <%=position.equals("1")? "checked" :"" %>> 1학년
		<input type="radio" name="position" value="2" class="position" <%=position.equals("2")? "checked" :"" %>> 2학년
		<input type="radio" name="position" value="3" class="position" <%=position.equals("3")? "checked" :"" %>> 3학년
		<input type="radio" name="position" value="4" class="position" <%=position.equals("4")? "checked" :"" %>> 4학년
      </td>
    </tr>
    
	<tr>
      <th>취미</th>
      <td>
      	<input type="checkbox" name="hobby" value="프로그램" class="hobby" <%for(int i=0;i<hobby.length;i++){if(hobby[i].equals("프로그램")){%>checked <%}}%>> 프로그램
		<input type="checkbox" name="hobby" value="독서" class="hobby" <%for(int i=0;i<hobby.length;i++){if(hobby[i].equals("독서")){%>checked <%}}%>> 독서
		<input type="checkbox" name="hobby" value="등산" class="hobby" <%for(int i=0;i<hobby.length;i++){if(hobby[i].equals("등산")){%>checked <%}}%>> 등산
		<input type="checkbox" name="hobby" value="여행" class="hobby" <%for(int i=0;i<hobby.length;i++){if(hobby[i].equals("여행")){%>checked <%}}%>> 여행
		<input type="checkbox" name="hobby" value="낚시" class="hobby" <%for(int i=0;i<hobby.length;i++){if(hobby[i].equals("낚시")){%>checked <%}}%>> 낚시
		<input type="checkbox" name="hobby" value="영화보기" class="hobby" <%for(int i=0;i<hobby.length;i++){if(hobby[i].equals("영화보기")){%>checked <%}}%>> 영화보기
		<input type="checkbox" name="hobby" value="잠자기" class="hobby" <%for(int i=0;i<hobby.length;i++){if(hobby[i].equals("잠자기")){%>checked <%}}%>> 잠자기
		<input type="checkbox" name="hobby" value="멍때리기" class="hobby" <%for(int i=0;i<hobby.length;i++){if(hobby[i].equals("멍때리기")){%>checked <%}}%>> 멍때리기
      </td>
    </tr>
    
    <tr>
      <th>주소</th>
      <td>
      	<input type="text" name="address" id="address" value="<%=address%>">
      </td>
    </tr>
    
    <tr>
      <th>연락처</th>
      <td>
      	<input type="text" name="phone" id="phone" value="<%=phone%>">
      </td>
    </tr>
    
    <tr id="button">
      <td colspan="2">
	      <input type="button" value="등록" onclick="check()">
	      <input type="reset" value="취소">
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
	function check(){
		if(document.form.studNo.value==""){
			alert("학번이 입력되지 않았습니다!");
			document.form.studNo.focus();
			return false;
		}
		if(document.form.name.value==""){
			alert("이름이 입력되지 않았습니다!");
			document.form.name.focus();
			return false;
		}
		let cnt=0;
		let rdo=document.getElementsByName("position");
		for(let i=0;i<rdo.length;i++){
			if(rdo[i].checked==true){
				cnt++;
				break;
			}
		}
		if(cnt==0){
			alert("학년이 선택되지 않았습니다!");
			return false;
		}
		if(document.form.address.value==""){
			alert("주소가 입력되지 않았습니다!");
			document.form.address.focus();
			return false;
		}
		if(document.form.phone.value==""){
			alert("연락처가 입력되지 않았습니다!");
			document.form.phone.focus();
			return false;
		}
		if(document.form.phone.value.length!=11){
			alert("잘못된 전화번호 입니다!");
			document.form.phone.focus();
			return false;
		}
		
		document.form.submit();
	}
</script>
</body>
</html>