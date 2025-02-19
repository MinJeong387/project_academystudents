<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="header">

	<ul style="list-style: none;">
		<c:choose>
			<c:when test="${empty authUser }">
				<li><a href="<c:url value="/users/join" />"
					style="display: inline-block; padding: 10px 20px; background-color: #f0f0f0; border: 1px solid #ccc; border-radius: 5px; text-decoration: none;">회원가입</a>
				</li>
				<li><a href="<c:url value="/users/login" />"
					style="display: inline-block; padding: 10px 20px; background-color: #f0f0f0; border: 1px solid #ccc; border-radius: 5px; text-decoration: none;">로그인(나중에
						비밀번호 찾기로 변경할까 고민중)</a>
				</li>
			</c:when>
			<c:otherwise>
				<li>${sessionScope.authUser.name }님,안녕하세요^^</li>
				<li><a href="<c:url value="/users/logout" />">로그아웃</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>
<!-- /header -->