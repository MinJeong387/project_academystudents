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
            height: 100vh;
        }

        .left-content {
            flex: 2;
            padding: 20px;
            overflow-y: auto;
        }

        .right-content {
            flex: 1;
            padding: 20px;
            background-color: #f8f9fa;
            overflow-y: auto;
        }

        table {
            width: 100%;
            table-layout: auto;
        }

        th,
        td {
            white-space: nowrap;
        }

        th:nth-child(1),
        th:nth-child(4),
        th:nth-child(5) {
            min-width: 80px;
        }

        .contents-cell {
            width: 100%;
            word-wrap: break-word;
            white-space: normal;
        }
    </style>
</head>

<body class="d-flex">
    <div style="width: 250px; flex-shrink: 0;">
        <jsp:include page="main.jsp" />
    </div>

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
                            <td class="contents-cell">${vo2.contents}</td>
                            <td>${vo2.sno} - ${vo2.studentName}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="right-content">
            <h1 class="mt-4 mb-4">선생님 목록</h1>
            <p class="mb-4">등록된 선생님 리스트입니다.</p>
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
            <br/>
            <p style="color: red;" ><strong>전체 학생 수 : ${totalStudents}명</strong></p>
            <p style="color: red;"><strong>전체 선생님 수 : ${totalTeachers}명</strong></p>
        </div>
    </div>
</body>

</html>