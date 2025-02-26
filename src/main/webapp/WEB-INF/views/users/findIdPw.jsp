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
    <title>아이디/비밀번호 찾기</title>
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
    </style>
</head>

<body>
    <div class="container">
        <br />
        <h1 class="text-center my-4">아이디/비밀번호 찾기</h1>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <form id="find-form" name="findform" method="POST" action="<c:url value="/users/findIdPwAction" />">
                    <div class="mb-3">
                        <label for="name" class="form-label">이름</label>
                        <input type="text" class="form-control" id="name" name="name" value="${param.name}">
                    </div>
                    <div class="mb-3">
                        <label for="cellPhone" class="form-label">연락처</label>
                        <input type="text" class="form-control" id="cellPhone" name="cellPhone" value="${param.cellPhone}">
                    </div>
                    <button type="submit" class="btn btn-custom">찾기</button>
                   
                </form>
                <c:if test="${not empty findError}">
                    <p class="text-danger text-center">${findError}</p>
                    <a href="<c:url value="/users/" />" class="btn btn-custom">로그인하러 가기</a>
                </c:if>
                <c:if test="${not empty foundUser}">
                    <p class="text-success text-center">아이디: ${foundUser.id}, 비밀번호: ${foundUser.pw.substring(0, 1)}${'*'.repeat(foundUser.pw.length() - 1)}</p>
                    <p class="text-center" style="color: green;">전체 비밀번호는 해당 연락처로 문자 보내드렸습니다. </p>
                    <a href="<c:url value="/users/" />" class="btn btn-custom">로그인하러 가기</a>
                </c:if>
            </div>
        </div>
    </div>
</body>

</html>