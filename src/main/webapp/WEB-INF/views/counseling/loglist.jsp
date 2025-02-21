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
    <title>상담일지 목록</title>
</head>

<body class="d-flex">
    <jsp:include page="../students/main.jsp" />

    <div class="flex-grow-1 p-3">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1 class="mt-4 mb-0">상담일지 목록</h1>
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="studentDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                    학생 번호 선택
                </button>
                <ul class="dropdown-menu" aria-labelledby="studentDropdown">
                    <c:forEach items="${studentNumbers}" var="number">
                        <li><a class="dropdown-item" href="<c:url value="/counseling/list?studentNo=${number}" />">${number}</a></li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <p class="mb-4">등록된 상담일지 목록입니다. (최신순)</p>
        <table class="table table-bordered table-striped table-hover mb-4">
            <thead>
                <tr>
                	<th>순서</th>
                    <th>학생 번호</th>
                    <th>이름</th>
                    <th>상담 날짜</th>
                    <th>상담 내용</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="vo">
                    <tr>
                    	<td>${vo.no}</td>
                        <td>${vo.sno}</td>
                        <td>${vo.studentName}</td>
                        <td>${vo.date}</td>
                        <td>${vo.contents}</td>
                        <td>
                            <a href="<c:url value="/counseling/modify/${vo.no}" />" class="btn btn-primary btn-sm">수정</a>
                            <a href="<c:url value="/counseling/delete/${vo.no}" />" class="btn btn-danger btn-sm">삭제</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="<c:url value="/counseling/write" />" class="btn btn-success">상담일지 등록</a>
    </div>
</body>

</html>