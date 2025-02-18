<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- link rel="stylesheet" 
		href="<c:url value="/assets/css/phonebook.css" />" /-->
</head>
<body>

	<h1>학생정보 등록</h1>

	<h2>등록폼</h2>

	<p>
		학생 정보를 등록하려면<br> 아래 항목을 기입하고 "등록" 버튼을 클릭하세요
	</p>

	<form action="<c:url value="/students/write" />" method="POST">
		<div>
			<label>이름</label> 
			<input type="text" name="name">
		</div>
		
		<div>
			<label>학교명</label> 
			<input type="text" name="schoolName">
		</div>
		
		<div>
			<label>학년</label> 
			<input type="number" name="schoolGrade">
		</div>
		
		<div>
			<label>생년월일(0000-00-00)</label> 
			<input type="text" name="birthdate">
		</div>
		
		<div>
			<label>성별(남/여)</label> 
			<input type="text" name="gender">
		</div>
		

		<div>
			<label>학생연락처</label> 
			<input type="text" name="studentCellphone">
		</div>

		<div>
			<label>부모님연락처</label> 
			<input type="text" name="parentCellphone">
		</div>
		
		<div>
			<label>특이사항</label> 
			<input type="text" name="comments">
		</div>

		<button type="submit">등록</button>



	</form>

	<br>
	<br>
	<a href="<c:url value="/students/list" />">리스트페이지로 이동</a>

</body>
</html>