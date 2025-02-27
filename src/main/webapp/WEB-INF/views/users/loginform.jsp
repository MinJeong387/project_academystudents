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
            background-image: url('/images/yellowComputer.jpg'); /* 배경 이미지 설정 */
            background-size: 192px 192px; /* 이미지 크기 조절 (바둑판 크기) */
            background-repeat: repeat; /* 바둑판 패턴으로 반복 */
            background-attachment: fixed; /* 배경 이미지 고정 */
            font-family: 'Noto Sans KR', sans-serif;
            font-weight: bold;
            display: flex; /* 화면 중앙 정렬을 위한 flexbox 설정 */
            align-items: center;
            justify-content: center;
            min-height: 100vh; /* 최소 높이를 100vh로 설정 */
            margin: 0; /* 기본 margin 제거 */
        }

        .container {
            background-color: rgba(255, 255, 255, 0.9); /* 컨테이너 배경에 반투명 흰색 적용 */
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
            width: 600px; /* 컨테이너 너비 조정 */
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
            width: 100%; /* 입력 필드 너비를 컨테이너에 맞게 조정 */
            margin: 10px 0; /* 상하 마진 조정 */
            border: 2px solid #E6B41B; /* 테두리 색상 및 두께 추가 */
        }

        .mb-3 {
            margin: 10px 0; /* 상하 마진 조정 */
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
        <h1 class="text-center my-4">최고다! 컴퓨터학원</h1>
        <form id="login-form" name="loginform" method="POST" action="<c:url value="/users/login" />">
            <div class="mb-3">
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
</body>

</html>