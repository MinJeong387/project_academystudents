<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>개인 출석 정보</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
        crossorigin="anonymous">
    <style>
        .list-container {
            height: calc(100vh - 80px); /* 화면 높이에서 헤더 높이(80px)를 뺀 값 */
            overflow-y: auto;
        }

        .student-info {
            font-size: 1.1rem;
            font-weight: bold;
            padding: 1rem;
            background-color: #f0f8ff; /* 연한 하늘색 배경 */
            margin-bottom: 1rem;
            border-radius: 5px; /* 둥근 테두리 */
        }

        .blue-text {
            color: blue;
        }
    </style>
</head>

<body class="d-flex">
    <div style="width: 250px; flex-shrink: 0;">
        <jsp:include page="../students/main.jsp" />
    </div>

    <div class="flex-grow-1 p-3 list-container" style="position: relative;">
        <div class="mb-4">
            <h1 class="mt-4 mb-0">개인 출석 정보</h1>
        </div>
        <div class="student-info">
            학생 번호&nbsp <span class="blue-text">${studentNo}</span>
            &nbsp &nbsp &nbsp&nbsp&nbsp 학생 이름&nbsp <span class="blue-text">${studentName}</span>
            &nbsp &nbsp &nbsp 담당 선생님&nbsp <span class="blue-text">${teacherNo} - ${teacherName}</span>
        </div>
        <table class="table table-bordered table-striped table-hover">
            <thead>
                <tr>
                    <th>출석 날짜</th>
                    <th>출석 상태</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${attendanceList}" var="attendance">
                    <tr>
                        <td>${attendance.attendanceDate}</td>
                        <td>${attendance.attendanceStatus}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="/attendance/list" class="btn btn-secondary">목록으로</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>