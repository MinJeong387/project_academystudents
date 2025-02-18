<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
	<h1>학생정보</h1>
	<h2>수정폼</h2>
	<p>
		학생정보를 수정하려면<br>
		아래 항목을 기입하고 "수정" 버튼을 클릭하세요
	</p>
	<form action="<c:url value="/students/modify" />" method="POST">
	
		<input type="hidden" name="no" value="${vo.no}" />
		
		<div>
			<label>이름</label> 
			<input type="text" name="name" value="${vo.name}">
		</div>
		
		<div>
			<label>학교명</label> 
			<input type="text" name="schoolName" value="${vo.schoolName}">
		</div>
		
		<div>
			<label>학년</label> 
			<input type="number" name="schoolGrade" value="${vo.schoolGrade}">
		</div>
		
		<div>
			<label>생년월일(0000-00-00)</label> 
			<input type="text" name="birthdate" value="${vo.birthdate}">
		</div>
		
		<div>
			<label>성별(남/여)</label> 
			<input type="text" name="gender" value="${vo.gender}">
		</div>
		
		<div>
			<label>학생연락처</label> 
			<input type="text" name="studentCellphone" value="${vo.studentCellphone}">
		</div>

		<div>
			<label>부모님연락처</label> 
			<input type="text" name="parentCellphone" value="${vo.parentCellphone}">
		</div>
		
		<div>
			<label>특이사항</label> 
			<input type="text" name="comments" value="${vo.comments}">
		</div>
		
		<button type="submit">수정</button>

	</form>

	<br>
	<br>
	<a href="<c:url value="/students/list" />">리스트페이지로 이동</a>

</body>

</html>