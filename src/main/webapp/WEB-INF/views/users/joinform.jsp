<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<title>회원가입</title>

</head>

<body>
	<div id="container">
	
		<div id="wrapper">
			<div id="content">

				<h1>회원 가입</h1>

                <form:form modelAttribute="userVo" id="join-form" name="joinForm"
                    action="${pageContext.servletContext.contextPath }/users/join"
                    method="POST">

                    <label for="id">아이디</label>
                    <form:input type="text" path="id" placeholder="아이디를 입력하세요" />
                    <c:if test="${not empty idError}">
                        <span style="color: red;">${idError}</span>
                    </c:if>
                    <br />

                    <label for="pw">비밀번호</label>
                    <form:input type="password" path="pw" placeholder="비밀번호를 입력하세요" />
                    <br />

                    <label for="name">이름</label>
                    <form:input path="name" placeholder="이름을 입력하세요" />
                    <br />

                    <label for="cellPhone">연락처</label>
                    <form:input path="cellPhone" placeholder="휴대폰 번호를 입력하세요" />
                    <c:if test="${not empty cellPhoneError}">
                        <span style="color: red;">${cellPhoneError}</span>
                    </c:if>
                    <br />

                    <c:if test="${not empty emptyFieldsError}">
                        <span style="color: red;">${emptyFieldsError}</span>
                    </c:if>
                    <br />

                    <input type="submit" value="회원가입">
                </form:form>				
				
		
				</div>
		</div>

		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>
</body>
</html>