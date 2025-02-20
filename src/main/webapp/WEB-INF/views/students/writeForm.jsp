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
    <title>학생 정보 등록</title>
</head>

<body class="d-flex">
    <div class="col-md-3">
        <jsp:include page="main.jsp" />
    </div>
    <div class="col-md-9 p-3">
        <h1 class="mb-4">학생 정보 등록</h1>

        <form id="writeForm" action="/students/write" method="POST" class="row g-3">
            <div class="col-md-6">
                <label for="name" class="form-label">이름</label>
                <input type="text" class="form-control" id="name" name="name">
            </div>

            <div class="col-md-6">
                <label for="schoolName" class="form-label">학교명</label>
                <input type="text" class="form-control" id="schoolName" name="schoolName">
            </div>

            <div class="col-md-6">
                <label for="schoolGrade" class="form-label">학년</label>
                <input type="number" class="form-control" id="schoolGrade" name="schoolGrade">
            </div>

            <div class="col-md-6">
                <label for="birthdate" class="form-label">생년월일(YYYY-MM-DD)</label>
                <input type="text" class="form-control" id="birthdate" name="birthdate">
            </div>

            <div class="col-md-6">
                <label for="gender" class="form-label">성별(남/여)</label>
                <input type="text" class="form-control" id="gender" name="gender">
            </div>

            <div class="col-md-6">
                <label for="studentCellphone" class="form-label">학생 연락처</label>
                <input type="text" class="form-control" id="studentCellphone" name="studentCellphone">
            </div>

            <div class="col-md-6">
                <label for="parentCellphone" class="form-label">부모님 연락처</label>
                <input type="text" class="form-control" id="parentCellphone" name="parentCellphone">
            </div>

            <div class="col-md-12">
                <label for="comments" class="form-label">특이사항</label>
                <input type="text" class="form-control" id="comments" name="comments">
            </div>

            <div class="col-12">
                <button type="submit" class="btn btn-primary">등록</button>
            </div>
        </form>
    </div>
</body>

</html>