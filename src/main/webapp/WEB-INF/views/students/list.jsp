<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--link rel="stylesheet" 
		href="<c:url value="/assets/css/phonebook.css" />" /-->
</head>

<body>

	<h1>전화번호부</h1>

	<h2>리스트</h2>

	<p>등록된 전화번호 리스트입니다.</p>


	<c:forEach items="${list}" var="vo">

		<table border="1">
			<tr>
				<th>이름(name)</th>
				<td>${vo.name}</td>
			</tr>
			<tr>
				<th>학생핸드폰</th>
				<td>${vo.studentCellphone}</td>
			</tr>
			<tr>
				<th>부모님핸드폰</th>
				<td>${vo.parentCellphone}</td>
			</tr>
			<tr>
				<td><a href="<c:url value="/delete/${vo.no}" />">[삭제]</a></td>
				<td><a href="<c:url value="/modify/${vo.no}" />">[수정]</a></td>
			</tr>

		</table>
	</c:forEach>
	<br>

	<a href="<c:url value="/write" />">추가번호 등록</a>

</body>

</html>