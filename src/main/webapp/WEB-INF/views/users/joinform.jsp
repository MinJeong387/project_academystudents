<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
    <title>회원가입</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            background-image: url('/images/yellowComputer.jpg');
            background-size: 192px 192px;
            background-repeat: repeat;
            background-attachment: fixed;
            font-family: 'Noto Sans KR', sans-serif;
            font-weight: bold;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 600px;
        }

        .btn-custom {
            background-color: #1D809F;
            color: white;
            font-weight: bold;
            width: 200px;
            padding: 10px 20px;
            border-radius: 20px;
            display: inline-block; /* 버튼을 인라인 블록 요소로 변경 */
            margin: 10px; /* 버튼 간 간격 조정 */
        }

        .btn-custom:hover {
            background-color: #196d87;
            color: white;
        }

        .form-control {
            border-radius: 20px;
            padding: 10px 20px;
            width: 100%;
            margin: 10px 0;
            border: 2px solid #E6B41B;
        }

        .mb-3 {
            margin: 10px 0;
        }

        .find-link {
            color: red;
            text-decoration: underline;
            display: block;
            text-align: center;
            margin-top: 20px;
        }

        .form-group {
            padding: 5px;
            text-align: center;
        }

        .form-row {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-label {
            text-align: left;
            padding-right: 10px;
        }
    </style>
</head>

<body>
    <div class="container">
        <h1 class="text-center my-4">최고다! 컴퓨터학원</h1>
        <div class="d-flex flex-column align-items-center">
            <form:form modelAttribute="userVo" id="join-form" name="joinForm"
                action="${pageContext.servletContext.contextPath }/users/join"
                method="POST" style="width: 500px;">
                <div class="form-group form-row">
                    <label for="id" class="col-md-3 form-label">아이디</label>
                    <div class="col-md-9">
                        <form:input type="text" path="id" class="form-control"
                            placeholder="아이디를 입력하세요" />
                        <c:if test="${not empty idError}">
                            <span style="color: red;" class="text-center">${idError}</span>
                        </c:if>
                    </div>
                </div>
                <div class="form-group form-row">
                    <label for="pw" class="col-md-3 form-label">비밀번호</label>
                    <div class="col-md-9">
                        <form:input type="password" path="pw" class="form-control"
                            placeholder="비밀번호를 입력하세요" />
                    </div>
                </div>
                <div class="form-group form-row">
                    <label for="name" class="col-md-3 form-label">이름</label>
                    <div class="col-md-9">
                        <form:input path="name" class="form-control" placeholder="이름을 입력하세요" />
                    </div>
                </div>
                <div class="form-group form-row">
                    <label for="cellPhone" class="col-md-3 form-label">연락처</label>
                    <div class="col-md-9">
                        <form:input path="cellPhone" class="form-control"
                            placeholder="휴대폰 번호를 입력하세요" />
                        <c:if test="${not empty cellPhoneError}">
                            <span style="color: red;" class="text-center">${cellPhoneError}</span>
                        </c:if>
                    </div>
                </div>
                <c:if test="${not empty emptyFieldsError}">
                    <div class="text-center">
                        <span style="color: red;">${emptyFieldsError}</span>
                    </div>
                </c:if>
                <br />
                <div class="text-center">
                    <input type="submit" value="회원가입" class="btn btn-custom">
                    <a href="<c:url value="/users/" />" class="btn btn-custom">로그인하러 가기</a>
                </div>
            </form:form>
        </div>
    </div>
</body>
</html>