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
    <title>학생 리스트</title>
</head>

<body class="d-flex">
    <jsp:include page="main.jsp" />
    
    <div class="flex-grow-1 p-3">
                <h1 class="mt-4 mb-4">학생 리스트</h1>
                <p class="mb-4">등록된 학생들 리스트입니다.</p>
                <table class="table table-bordered table-striped table-hover mb-4">
                    <thead>
                        <tr>
                            <th>이름</th>
                            <th>학교명</th>
                            <th>학년</th>
                            <th>생년월일</th>
                            <th>성별</th>
                            <th>학생연락처</th>
                            <th>부모님연락처</th>
                            <th>특이사항</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list}" var="vo">
                            <tr>
                                <td>${vo.name}</td>
                                <td>${vo.schoolName}</td>
                                <td>${vo.schoolGrade}</td>
                                <td>${vo.birthdate}</td>
                                <td>${vo.gender}</td>
                                <td>${vo.studentCellphone}</td>
                                <td>${vo.parentCellphone}</td>
                                <td>${vo.comments}</td>
                                <td>
                                    <a href="<c:url value="/students/modify/${vo.no}" />" class="btn btn-primary btn-sm">수정</a>
                                    <a href="<c:url value="/students/delete/${vo.no}" />" class="btn btn-danger btn-sm">삭제</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <a href="<c:url value="/students/write" />" class="btn btn-success">추가 학생 등록</a>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>