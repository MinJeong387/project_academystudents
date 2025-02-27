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
        th:nth-child(2),
        th:nth-child(3) {
            min-width: 80px;
        }

        .contents-cell {
            width: 100%;
            word-wrap: break-word;
            white-space: normal;
        }

        #dropdownMenu {
            max-height: 200px; /* 4개 항목 높이 제한 (약 50px * 4) */
            overflow-y: auto;
        }
    </style>
</head>

<body class="d-flex">
    <div style="width: 250px; flex-shrink: 0;">
        <jsp:include page="../students/main.jsp" />
    </div>

    <div class="flex-grow-1 p-3 list-container">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1 class="mt-4 mb-0">상담일지 목록</h1>
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="studentDropdown"
                    onclick="toggleDropdown()">
                    학생 번호 선택
                </button>
                <ul class="dropdown-menu" id="dropdownMenu">
                    <c:forEach items="${studentList}" var="student">
                        <li><a class="dropdown-item"
                                href="<c:url value="/counseling/list?studentNo=${student.no}" />">${student.no} -
                                ${student.name}</a></li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <p class="mb-4">등록된 상담일지 목록입니다. (최신순)</p>
        <table class="table table-bordered table-striped table-hover mb-4">
            <thead>
                <tr>
                    <th>순서</th>
                    <th>학생</th>
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
                        <td class="contents-cell">${vo.contents}</td>
                        <td>
                            <a href="<c:url value="/counseling/modify/${vo.no}" />"
                                class="btn btn-primary btn-sm">수정</a>
                            <a href="#" class="btn btn-danger btn-sm"
                                onclick="confirmDelete(${vo.no})">삭제</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <nav aria-label="Page navigation">
            <ul class="pagination justify-content-center">
                <c:if test="${currentPage > 1}">
                    <li class="page-item">
                        <a class="page-link" href="<c:url value="/counseling/list?page=${currentPage - 1}${param.studentNo != null ? '&studentNo=' += param.studentNo : ''}" />"
                            aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>

                <c:forEach var="i" begin="1" end="${totalPages}">
                    <li class="page-item ${currentPage == i ? 'active' : ''}">
                        <a class="page-link" href="<c:url value="/counseling/list?page=${i}${param.studentNo != null ? '&studentNo=' += param.studentNo : ''}" />">${i}</a>
                    </li>
                </c:forEach>

                <c:if test="${currentPage < totalPages}">
                    <li class="page-item">
                        <a class="page-link" href="<c:url value="/counseling/list?page=${currentPage + 1}${param.studentNo != null ? '&studentNo=' += param.studentNo : ''}" />"
                            aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </nav>

        <a href="<c:url value="/counseling/write" />" class="btn btn-success">상담일지 등록</a>
    </div>

    <script>
    function toggleDropdown() {
        var dropdownMenu = document.getElementById("dropdownMenu");
        if (dropdownMenu.style.display === "block") {
            dropdownMenu.style.display = "none";
        } else {
            dropdownMenu.style.display = "block";
        }
    }

    window.onclick = function (event) {
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