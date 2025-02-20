<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<body>
    <h1>학생 정보 등록</h1>
    <form id="writeForm" action="/students/write" method="POST">
        <div>
            <label>이름</label>
            <input type="text" name="name">
        </div>
        <div>
            <label>학교명</label>
            <input type="text" name="schoolName">
        </div>
        <div>
            <label>학년</label>
            <input type="number" name="schoolGrade">
        </div>
        <div>
            <label>생년월일(YYYY-MM-DD)</label>
            <input type="text" name="birthdate">
        </div>
        <div>
            <label>성별(남/여)</label>
            <input type="text" name="gender">
        </div>
        <div>
            <label>학생 연락처</label>
            <input type="text" name="studentCellphone">
        </div>
        <div>
            <label>부모님 연락처</label>
            <input type="text" name="parentCellphone">
        </div>
        <div>
            <label>특이사항</label>
            <input type="text" name="comments">
        </div>
        <button type="submit">등록</button>
    </form>
</body>
</html>