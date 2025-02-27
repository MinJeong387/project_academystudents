<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>수업일지 수정</title>
</head>

<body class="d-flex">
    <div class="col-md-3">
        <jsp:include page="../students/main.jsp" />
    </div>
    <div class="col-md-9 p-3">
        <h1 class="mb-4">수업일지 수정</h1>

        <form id="modifyForm" action="/lesson/modify" method="POST" class="row g-3">

            <div class="col-md-6">
                <label for="no" class="form-label">순서</label>
                <input type="text" class="form-control" id="no" name="no" value="${vo.no}" readonly>
            </div>

            <div class="col-md-6">
                <label for="uno" class="form-label">선생님 번호</label>
                <input type="number" class="form-control" id="unoDisplay" value="${sessionScope.userNo}" readonly>
                <input type="hidden" id="uno" name="uno" value="${sessionScope.userNo}">
            </div>

            <div class="col-md-6">
                <label for="date" class="form-label">수업 날짜 (YYYY-MM-DD)</label>
                <input type="date" class="form-control" id="date" name="date" value="${vo.date}">
            </div>

            <div class="col-md-12">
                <label for="contents" class="form-label">수업 내용</label>
                <textarea class="form-control" id="contents" name="contents" rows="5">${vo.contents}</textarea>
            </div>

            <div class="col-12">
                <button type="submit" class="btn btn-primary">수정</button>
            </div>
        </form>
    </div>
</body>

</html>