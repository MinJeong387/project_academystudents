<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>개인 출석 정보</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h1>개인 출석 정보</h1>
        <table class="table table-bordered">
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