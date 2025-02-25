<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>헤더</title>
    <style>
        #header ul {
            list-style: none;
            text-align: center;
        }

        #header ul li a.btn-custom {
            width: 200px;
            padding: 10px 20px;
            border-radius: 20px;
            background-color: #1D809F;
            color: white;
            font-weight: bold;
            display: block;
            margin: 10px auto; /* 상하 마진 추가 */
            text-decoration: none;
        }

        #header ul li a.btn-custom:hover {
            background-color: #196d87;
        }

        #header ul li a.login-button {
            display: block;
            padding: 10px 20px;
            background-color: #f0f0f0;
            border: 1px solid #ccc;
            border-radius: 5px;
            text-decoration: none;
            color: black;
            width: 200px;
            margin: 10px auto;
        }

        #header ul li a.login-button:hover {
            background-color: #e0e0e0;
        }

        #header ul li a.logout-button {
            background-color: #1D809F;
            border-color: #1D809F;
            color: white;
            border-radius: 20px;
            padding: 10px 20px;
            text-decoration: none;
            width: 200px;
            margin: 10px auto;
            display: block;
        }

        #header ul li a.logout-button:hover {
            background-color: #196d87;
            border-color: #196d87;
        }
    </style>
</head>

<body>
    <div id="header">
        <ul>
            <c:choose>
                <c:when test="${empty authUser}">
                    <li><a href="<c:url value="/users/join" />" class="btn-custom">회원가입</a></li>
                    <li><a href="<c:url value="/users/login" />" class="login-button">아이디/비밀번호 찾기</a></li>
                </c:when>
                <c:otherwise>
                    <li>${sessionScope.authUser.name}님, 안녕하세요^^</li>
                    <li><a href="<c:url value="/users/logout" />" class="logout-button">로그아웃</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</body>

</html>