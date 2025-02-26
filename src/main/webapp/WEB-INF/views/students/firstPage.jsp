<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <title>첫 화면</title>
    <style>
        .split-container {
            display: flex;
            height: 100vh; /* 화면 전체 높이 */
        }

        .left-content {
            flex: 2; /* 왼쪽 영역은 2/3 차지 */
            padding: 20px;
            overflow-y: auto; /* 내용이 많을 경우 스크롤 */
        }

        .right-content {
            flex: 1; /* 오른쪽 영역은 1/3 차지 */
            padding: 20px;
            background-color: #f8f9fa; /* 선택적으로 배경색 추가 */
            overflow-y: auto; /* 내용이 많을 경우 스크롤 */
        }
    </style>
</head>

<body class="d-flex">
    <jsp:include page="main.jsp" />

    <div class="split-container flex-grow-1">
        <div class="left-content">
            <h1 class="mt-4 mb-4">최근 등록 학생</h1>
            <p class="mb-4">최근에 등록한 학생 리스트입니다.</p>
            <table class="table table-bordered table-striped table-hover mb-4">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>이름</th>
                        <th>학교명</th>
                        <th>학년</th>
                        <th>담당선생님</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="vo">
                        <tr>
                            <td>${vo.no}</td>
                            <td>${vo.name}</td>
                            <td>${vo.schoolName}</td>
                            <td>${vo.schoolGrade}</td>
                            <td>${vo.teacherNo} - ${vo.teacherName}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <h1 class="mt-4 mb-4">최근 상담 일지</h1>
            <p class="mb-4">최근 등록된 상담 일지 리스트입니다.</p>
            <table class="table table-bordered table-striped table-hover mb-4">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>상담 날짜</th>
                        <th>상담 내용</th>
                        <th>학생 정보</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list2}" var="vo2">
                        <tr>
                            <td>${vo2.no}</td>
                            <td>${vo2.date}</td>
                            <td>${vo2.contents}</td>
                            <td>${vo2.sno} - ${vo2.studentName}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="right-content">
            <h1 class="mt-4 mb-4">사용자 목록</h1>
            <p class="mb-4">등록된 사용자 리스트입니다.</p>
            <table class="table table-bordered table-striped table-hover mb-4">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>이름</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list3}" var="vo3">
                        <tr>
                            <td>${vo3.no}</td>
                            <td>${vo3.name}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>

</html>