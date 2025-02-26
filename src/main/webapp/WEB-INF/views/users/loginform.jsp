<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
        crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <title>로그인</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            background-color: #E6B41B;
            font-family: 'Noto Sans KR', sans-serif;
            font-weight: bold;
        }

        .btn-custom {
            background-color: #1D809F;
            color: white;
            font-weight: bold;
            width: 200px;
            margin: 30px auto;
            padding: 10px 20px;
            border-radius: 20px;
            display: block;
        }

        .btn-custom:hover {
            background-color: #196d87;
            color: white;
        }

        .form-control {
            border-radius: 20px;
            padding: 10px 20px;
            width: 500px;
            margin: 10px auto;
        }

        .mb-3 {
            margin: auto;
            width: 500px;
        }

        .find-link {
            color: red;
            text-decoration: underline;
            display: block;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>

<body>
    <div class="container">
        <br />
        <h1 class="text-center my-4">최고다! 컴퓨터학원</h1>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <form id="login-form" name="loginform" method="POST" action="<c:url value="/users/login" />">
                    <div class="mb-3">
                        <br /><br />
                        <label for="id" class="form-label">아이디</label>
                        <input type="text" class="form-control" id="id" name="id" value="${param.id}">
                    </div>
                    <div class="mb-3">
                        <label for="pw" class="form-label">패스워드</label>
                        <input type="password" class="form-control" id="pw" name="pw" value="${param.pw}">
                    </div>
                    <c:if test="${not empty loginError}">
                        <p class="text-danger text-center">${loginError}</p>
                    </c:if>
                    <button type="submit" class="btn btn-custom">로그인</button>
                </form>
                <a href="<c:url value="/users/join" />" class="btn btn-custom">회원가입</a>
                <a href="<c:url value="/users/findIdPw" />" class="find-link">아이디/비밀번호 찾기</a>
            </div>
        </div>
    </div>
</body>

</html>