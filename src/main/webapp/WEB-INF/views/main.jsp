<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
	prefix="c" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>최고다! 컴퓨터학원</title>
	<!-- link rel="stylesheet" 
		href="<c:url value="/assets/css/phonebook.css" />" /-->	
</head>

<body>

	<h1>최고다! 컴퓨터학원</h1>


	<p>
		회원정보를 입력해주세요.
	</p>

	<form action="<c:url value="/modify" />" method="POST">
		<input type="hidden" name="id" value="${vo.id }" />
		
		<div>
			<label>이름(name)</label>
			<input type="text" name="name" value="${vo.name }">
		</div>

		<div>
			<label>핸드폰(hp)</label>
			<input type="text" name="hp" value="${vo.hp }">
		</div>

		<div>
			<label>회사(company)</label>
			<input type="text" name="tel" value="${vo.tel }">
		</div>

		<button type="submit">등록</button>



	</form>

	<br>
	<br>
	<a href="<c:url value="/" />">리스트페이지로 이동</a>

</body>

</html>