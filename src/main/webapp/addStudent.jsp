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
<h2>학사 정보 등록</h2>
<form name="form" method="post" action="addStudentProcess.jsp" id="form-add">
<table id="tab-add">
    <tr>
      <th>학번</th>
      <td>
      	<input type="text" name="studNo" id="studNo">
      </td>
    </tr>
    
    <tr>
      <th>성명</th>
      <td>
      	<input type="text" name="name" id="name">
      </td>
    </tr>
    
    <tr>
      <th>학과</th>
      <td>
		<select name="dept" id="dept">
			<option value="1">컴퓨터공학과</option>
			<option value="2">기계공학과</option>
			<option value="3">전자과</option>
			<option value="4">영문학과</option>
			<option value="5">일어과</option>
			<option value="6">경영학과</option>
			<option value="7">무역학과</option>
			<option value="8">교육학과</option>
		</select>	
      </td>
    </tr>
    
    <tr>
      <th>학년</th>
      <td>
      	<input type="radio" name="position" value="1" class="position"> 1학년
		<input type="radio" name="position" value="2" class="position"> 2학년
		<input type="radio" name="position" value="3" class="position"> 3학년
		<input type="radio" name="position" value="4" class="position"> 4학년
      </td>
    </tr>
    
	<tr>
      <th>취미</th>
      <td>
      	<input type="checkbox" name="hobby" value="프로그램" class="hobby"> 프로그램
		<input type="checkbox" name="hobby" value="독서" class="hobby"> 독서
		<input type="checkbox" name="hobby" value="등산" class="hobby"> 등산
		<input type="checkbox" name="hobby" value="여행" class="hobby"> 여행
		<input type="checkbox" name="hobby" value="낚시" class="hobby"> 낚시
		<input type="checkbox" name="hobby" value="영화보기" class="hobby"> 영화보기
		<input type="checkbox" name="hobby" value="잠자기" class="hobby"> 잠자기
		<input type="checkbox" name="hobby" value="멍때리기" class="hobby"> 멍때리기
      </td>
    </tr>
    
    <tr>
      <th>주소</th>
      <td>
      	<input type="text" name="address" id="address">
      </td>
    </tr>
    
    <tr>
      <th>연락처</th>
      <td>
      	<input type="text" name="phone" id="phone" placeholder="'-' 생략">
      </td>
    </tr>
    
    <tr id="button">
      <td colspan="2">
	      <input type="button" value="등록" onclick="check()">
	      <input type="reset" value="취소">
      </td>
    </tr>
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