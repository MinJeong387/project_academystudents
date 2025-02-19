<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- TODO: 현재 페이지에 적절한 CSS를 임포트하십시오. -->
<!-- link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/css/users.css" / -->
</head>

<body>
	<div id="container">

		<h1>최고다! 컴퓨터학원</h1>
		
		<!-- c:import url="/WEB-INF/views/includes/navigation.jsp" / -->
		
		<div id="wrapper">
			<div id="content">
				<form id="login-form" name="loginform" method="POST" action="<c:url value="/users/login" />">

					<label class="block-label" for="id">아이디</label> 
					<input id="id" name="id" type="text" value=""> 
					<br/>
					
					<label class="block-label">패스워드</label> 
					<input name="pw" type="password" value="">
					<br/>
					
					<c:if test="${not empty loginError}">
    					<p style="color: red;">${loginError}</p>
					</c:if>
	
					
					<input type="submit" value="로그인">
					<br/><br/>
					
					<c:import url="/WEB-INF/views/includes/header.jsp">
						<c:param name="param1" value="value1" />
						<c:param name="param2" value="value2" />
					</c:import>
		
				</form>
			</div>
		</div>

		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>
	
	
  
	
	
</body>
</html>