<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	nav{
		height: 80%;
		width: 18%;
		background-color:gray;
		line-height:65px;
		text-align:center;
		white-space: nowrap;
		float: left;
	}
	nav ul{
		list-style-type:none;
		padding:0.5% 0 0.5% 0;
		
	}
	nav li{
		display:block;
		padding:0 2% 0 2%;
	}
	nav li a{
		text-decoration:none;
		color:white;
		font-weight: bold;
	}
</style>
</head>
<body>
	<nav>
		<ul>
			<li><a href="addStudent.jsp">학사 정보 추가</a></li>
			<li><a href="addSubject.jsp">교과목 추가</a></li>
			<li><a href="addLecturer.jsp">강사 추가</a></li>
			<li><a href="">수강정보 추가</a></li>
			<li><a href="studentList.jsp">학사 정보 조회</a></li>
			<li><a href="subjectList.jsp">교과목 조회</a></li>
			<li><a href="subjectIdxList.jsp">교과목 조회 (강사 코드별)</a></li>
			<li><a href="lecturerList.jsp">강사 조회</a></li>
			<li><a href="">수강신청 조회</a></li>
			<li><a href="index.jsp">홈으로.</a></li>
		</ul>
	</nav>
</body>
</html>