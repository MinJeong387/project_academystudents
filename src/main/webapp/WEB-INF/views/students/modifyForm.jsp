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
    <title>학생 정보 수정</title>
</head>

<body class="d-flex">
    <div class="col-md-3">
        <jsp:include page="main.jsp" />
    </div>
    <div class="col-md-9 p-3">
        <h1 class="mb-4">학생 정보 수정</h1>

        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger" role="alert">
                ${errorMessage}
            </div>
        </c:if>

        <form id="modifyForm" action="/students/modify" method="POST" class="row g-3">
            <input type="hidden" name="no" value="${vo.no}" />

			<div class="col-md-6">
                <label for="no" class="form-label">번호</label>
                <input type="number" class="form-control" id="num" name="num" value="${vo.no}" readonly>
            </div>
            
            <div class="col-md-6">
                <label for="name" class="form-label">이름</label>
                <input type="text" class="form-control" id="name" name="name" value="${vo.name}">
            </div>

            <div class="col-md-6">
                <label for="schoolName" class="form-label">학교명</label>
                <input type="text" class="form-control" id="schoolName" name="schoolName" value="${vo.schoolName}">
            </div>

            <div class="col-md-6">
                <label for="schoolGrade" class="form-label">학년</label>
                <input type="number" class="form-control" id="schoolGrade" name="schoolGrade" value="${vo.schoolGrade}">
            </div>

            <div class="col-md-6">
                <label for="birthdate" class="form-label">생년월일(YYYY-MM-DD)</label>
                <input type="text" class="form-control" id="birthdate" name="birthdate" value="${vo.birthdate}">
            </div>

            <div class="col-md-6">
                <label for="gender" class="form-label">성별(남/여)</label>
                <input type="text" class="form-control" id="gender" name="gender" value="${vo.gender}">
            </div>

            <div class="col-md-6">
                <label for="studentCellphone" class="form-label">학생 연락처</label>
                <input type="text" class="form-control" id="studentCellphone" name="studentCellphone" value="${vo.studentCellphone}">
            </div>

            <div class="col-md-6">
                <label for="parentCellphone" class="form-label">부모님 연락처</label>
                <input type="text" class="form-control" id="parentCellphone" name="parentCellphone" value="${vo.parentCellphone}">
            </div>

            <div class="col-md-6">
                <label for="comments" class="form-label">특이사항</label>
                <input type="text" class="form-control" id="comments" name="comments" value="${vo.comments}">
            </div>
            
            <div class="col-md-6">
                <label for="teacherNo" class="form-label">담당선생님</label>
                <select class="form-select" id="teacherNo" name="teacherNo">
                    <c:forEach items="${users}" var="user">
                        <option value="${user.no}" ${user.no == vo.teacherNo ? 'selected' : ''}>${user.no} - ${user.name}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="col-12">
                <button type="submit" class="btn btn-primary">수정</button>
            </div>
        </form>
    </div>
</body>

</html>