<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>전체학생 리스트</title>
<!--link rel="stylesheet" 
		href="<c:url value="/assets/css/phonebook.css" />" /-->
</head>

<body>

	<h1>학생부</h1>

	<h2>리스트</h2>

	<p>등록된 학생들 리스트입니다.</p>


	<c:forEach items="${list}" var="vo">

		<table border="1">
			<tr>
				<th>이름</th>
				<th>학교명</th>
				<th>학년</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>학생연락처</th>
				<th>부모님연락처</th>
				<th>특이사항</th>
			</tr>
			
			<tr>
				<td>${vo.name}</td>				
				<td>${vo.schoolName}</td>
				<td>${vo.schoolGrade}</td>
				<td>${vo.birthdate}</td>
				<td>${vo.gender}</td>
				<td>${vo.studentCellphone}</td>
				<td>${vo.parentCellphone}</td>
				<td>${vo.comments}</td>				
			</tr>

			<tr>
				<td><a href="<c:url value="/students/modify/${vo.no}" />">[수정]</a></td>
				<td><a href="<c:url value="/students/delete/${vo.no}" />">[삭제]</a></td>
			</tr>

		</table>
	</c:forEach>
	<br>

	<!-- a href="<c:url value="/modify" />">학생정보 수정</a>
	<a href="<c:url value="/delete" />">학생정보 삭제</a -->
	<a href="<c:url value="/students/write" />">추가학생 등록</a>

</body>

</html>