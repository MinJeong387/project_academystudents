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
    <jsp:include page="main.jsp" />
    
    <div class="flex-grow-1 p-3">
       <h1>학생 정보 수정</h1><br/>
    <form id="modifyForm" action="/students/modify" method="POST">
        <input type="hidden" name="no" value="${vo.no}" />
        <div>
            <label>이름</label>
            <input type="text" name="name" value="${vo.name}">
        </div>
        <div>
            <label>학교명</label>
            <input type="text" name="schoolName" value="${vo.schoolName}">
        </div>
        <div>
            <label>학년</label>
            <input type="number" name="schoolGrade" value="${vo.schoolGrade}">
        </div>
        <div>
            <label>생년월일(YYYY-MM-DD)</label>
            <input type="text" name="birthdate" value="${vo.birthdate}">
        </div>
        <div>
            <label>성별(남/여)</label>
            <input type="text" name="gender" value="${vo.gender}">
        </div>
        <div>
            <label>학생 연락처</label>
            <input type="text" name="studentCellphone" value="${vo.studentCellphone}">
        </div>
        <div>
            <label>부모님 연락처</label>
            <input type="text" name="parentCellphone" value="${vo.parentCellphone}">
        </div>
        <div>
            <label>특이사항</label>
            <input type="text" name="comments" value="${vo.comments}">
        </div>
        <button type="submit">수정</button>
    </form>
    </div>
    
</body>
</html>