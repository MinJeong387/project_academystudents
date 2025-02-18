<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<!-- TODO: 현재 페이지에 적절한 CSS를 임포트하십시오. -->
<!-- link type="text/css" rel="stylesheet"
	href="<c:url value="/css/users.css" />" / >
<script src="<c:url value="/javascript/users.js" />"></script-->
</head>

<body>
	<!-- div id="container">
		<c:import url="/WEB-INF/views/includes/header.jsp">
			<c:param name="param1" value="value1" />
			<c:param name="param1" value="value2" />
		</c:import>
		<c:import url="/WEB-INF/views/includes/navigation.jsp" />
		<div id="wrapper">
			<div id="content" -->


				<h1>회원 가입</h1>

				<form:form modelAttribute="userVo" id="join-form"
					name="registerForm"
					action="${pageContext.servletContext.contextPath }/users/join"
					method="POST">
					
					<input type="hidden" name="a" value="join">


					<label for="id">아이디</label>
					<form:input type="id" path="id" placeholder="아이디를 입력하세요" />
					<br />
					<form:errors path="id" cssClass="error" />
					<br />
					
					
					<label for="pw">비밀번호</label>
					<form:input type="pw" path="pw" placeholder="비밀번호를 입력하세요" />
					<br />
					<form:errors path="pw" cssClass="error" />
					<br />
					

					<label for="name">이름</label>
					<form:input path="name" placeholder="이름을 입력하세요" />
					<br />
					
					<label for="cellPhone">연락처</label>
					<form:input path="cellPhone" placeholder="휴대폰 번호를 입력하세요" />
					<br />
					

					<!-- input id="check-email" type="button"
						data-target="<c:url value="/users/checkEmail" />" value="id 중복 체크">
					<br />
					<form:errors path="email" cssClass="error" />
					<input type="hidden" name="emailCheck" value="n">
					<br / -->
					

					
					<input type="submit" value="전송">

				</form:form>

			<!-- /div>
		</div>

		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div -->
	
</body>
</html>