<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <title>로그인</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet"> <style>
        body {
            background-color: #E6B41B;
            font-family: 'Noto Sans KR', sans-serif; /* 폰트 적용 */
            font-weight: bold; /* 글씨 bold 적용 */
        }
        .btn-lightbeige { 
            background-color: #1D809F;
            color: white; /* 버튼 텍스트 색상 */
            font-weight: bold;
        }
        .btn-lightbeige:hover { /* 클래스 이름 변경 */
            background-color: #196d87; /* 호버 시 버튼 색상 */

            color: white;
        }
    </style>
</head>

<body>
   <div class="container">
        <br/>
        <div class="text-center">
            <!-- img src="images/logo.jpg" alt="최고다! 컴퓨터학원 로고" width="150" -->
        </div>
        <h1 class="text-center my-4">최고다! 컴퓨터학원</h1>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <form id="login-form" name="loginform" method="POST" action="<c:url value="/users/login" />">
                    <div class="mb-3">
                    <br/><br/>
                        <label for="id" class="form-label">아이디</label>
                        <input type="text" class="form-control" id="id" name="id" value="">
                    </div>
                    <div class="mb-3">
                        <label for="pw" class="form-label">패스워드</label>
                        <input type="password" class="form-control" id="pw" name="pw">
                    </div>
                    <c:if test="${not empty loginError}">
                        <p class="text-danger">${loginError}</p>
                    </c:if>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-lightbeige">로그인</button>
                    </div>
                    <br/>
                    <c:import url="/WEB-INF/views/includes/header.jsp">
                        <c:param name="param1" value="value1" />
                        <c:param name="param2" value="value2" />
                    </c:import>
                </form>
            </div>
        </div>
        <!-- c:import url="/WEB-INF/views/includes/footer.jsp" / -->
    </div>
</body>
</html>