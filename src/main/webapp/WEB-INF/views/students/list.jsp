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
    <title>학생 리스트</title>
    <style>
        .list-container {
            height: calc(100vh - 80px); /* 화면 높이에서 헤더 높이(80px)를 뺀 값 */
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
        th:nth-child(8) {
            min-width: 80px;
        }

        .comments-cell {
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

    <div class="flex-grow-1 p-3 list-container">
        <h1 class="mt-4 mb-4">전체 학생 리스트</h1>
        <p class="mb-4">등록된 전체 학생들 리스트입니다.</p>

        <form action="/students/list" method="get" class="mb-3">
            <div class="row">
                <div class="col-md-6">
                    <div class="input-group">
                        <input type="text" name="searchKeyword" class="form-control" placeholder="학생 이름 또는 학생 연락처 검색"
                            value="${searchKeyword}">
                        <button type="submit" class="btn btn-primary">검색</button>
                    </div>
                </div>
            </div>
        </form>

        <table class="table table-bordered table-striped table-hover mb-4">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>이름</th>
                    <th>학교명</th>
                    <th>학년</th>
                    <th>생년월일</th>
                    <th>성별</th>
                    <th>학생연락처</th>
                    <th>부모님연락처</th>
                    <th>특이사항</th>
                    <th>담당선생님</th>
                    <th>관리</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="vo">
                    <tr>
                        <td>${vo.no}</td>
                        <td>${vo.name}</td>
                        <td>${vo.schoolName}</td>
                        <td>${vo.schoolGrade}</td>
                        <td>${vo.birthdate}</td>
                        <td>${vo.gender}</td>
                        <td>${vo.studentCellphone}</td>
                        <td>${vo.parentCellphone}</td>
                        <td class="comments-cell">${vo.comments}</td>
                        <td>${vo.teacherNo} - ${vo.teacherName}</td>

                        <td>
                            <a href="<c:url value="/students/modify/${vo.no}" />" class="btn btn-primary btn-sm">수정</a>
                            <a href="#" class="btn btn-danger btn-sm" onclick="confirmDelete(${vo.no})">삭제</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="<c:url value="/students/write" />" class="btn btn-success">추가 학생 등록</a>
    </div>

    <script>
        function confirmDelete(no) {
            if (confirm("정말로 삭제하시겠습니까?")) {
                window.location.href = "/students/delete/" + no;
            }
        }
    </script>
</body>

</html>