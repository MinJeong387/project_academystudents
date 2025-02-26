<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
        crossorigin="anonymous">
    <title>상담일지 목록</title>
    <style>
        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-menu {
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
            display: none;
        }

        .dropdown-menu a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-menu a:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>

<body class="d-flex">
    <jsp:include page="../students/main.jsp" />

    <div class="flex-grow-1 p-3">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1 class="mt-4 mb-0">상담일지 목록</h1>
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="studentDropdown" onclick="toggleDropdown()">
                    학생 번호 선택
                </button>
                <ul class="dropdown-menu" id="dropdownMenu">
                    <c:forEach items="${studentList}" var="student">
                        <li><a class="dropdown-item" href="<c:url value="/counseling/list?studentNo=${student.no}" />">${student.no} - ${student.name}</a></li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <p class="mb-4">등록된 상담일지 목록입니다. (최신순)</p>
        <table class="table table-bordered table-striped table-hover mb-4">
            <thead>
                <tr>
                    <th>순서</th>
                    <th>학생명</th>
                    <th>상담 날짜</th>
                    <th>상담 내용</th>
                    <th>관리</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="vo">
                    <tr>
                        <td>${vo.no}</td>
                        <td>${vo.sno} - ${vo.studentName}</td>
                        <td>${vo.date}</td>
                        <td>${vo.contents}</td>
                        <td>
                            <a href="<c:url value="/counseling/modify/${vo.no}" />" class="btn btn-primary btn-sm">수정</a>
                            <a href="#" class="btn btn-danger btn-sm" onclick="confirmDelete(${vo.no})">삭제</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="<c:url value="/counseling/write" />" class="btn btn-success">상담일지 등록</a>
    </div>

    <script>
        function toggleDropdown() {
            var dropdownMenu = document.getElementById("dropdownMenu");
            if (dropdownMenu.style.display === "none") {
                dropdownMenu.style.display = "block";
            } else {
                dropdownMenu.style.display = "none";
            }
        }

        window.onclick = function(event) {
            if (!event.target.matches('.dropdown-toggle')) {
                var dropdowns = document.getElementsByClassName("dropdown-menu");
                for (var i = 0; i < dropdowns.length; i++) {
                    var openDropdown = dropdowns[i];
                    if (openDropdown.style.display === "block") {
                        openDropdown.style.display = "none";
                    }
                }
            }
        }

        function confirmDelete(counselingNo) {
            if (confirm("정말 삭제하시겠습니까?")) {
                window.location.href = "/counseling/delete/" + counselingNo;
            }
        }
    </script>
</body>

</html>