<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
        crossorigin="anonymous">
    <title>출석 관리</title>
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

        .selected {
            background-color: lightgreen !important;
            color: darkgreen !important;
        }

        .top-right-dropdown {
            position: absolute;
            top: 50px;
            right: 10px;
            display: flex;
            align-items: center;
        }

        .calendar-container {
            margin-right: 10px;
        }

        .list-container {
            height: calc(100vh - 80px); /* 화면 높이에서 헤더 높이(80px)를 뺀 값 */
            overflow-y: auto;
        }

        #dropdownMenu {
            max-height: 200px; /* 4개 항목 높이 제한 (약 50px * 4) */
            overflow-y: auto;
        }
    </style>
</head>

<body class="d-flex">
    <jsp:include page="../students/main.jsp" />

    <div class="flex-grow-1 p-3 list-container" style="position: relative;">
        <div class="top-right-dropdown">
            <div class="calendar-container">
                <input type="date" id="attendanceDate">
            </div>
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="teacherDropdown"
                    onclick="toggleDropdown()">
                    선생님 번호 선택
                </button>
                <ul class="dropdown-menu" id="dropdownMenu">
                    <c:forEach items="${teacherList}" var="teacher">
                        <li><a class="dropdown-item"
                                href="<c:url value="/attendance/list?teacherNo=${teacher.no}" />">${teacher.no} -
                                ${teacher.name}</a></li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="mb-4">
            <h1 class="mt-4 mb-0">출석 관리</h1>
        </div>
        <table class="table table-bordered table-striped table-hover">
            <thead>
                <tr>
                    <th>학생 번호</th>
                    <th>학생 이름</th>
                    <th>담당선생님</th>
                    <th>출석</th>
                    <th>결석</th>
                    <th>지각</th>
                    <th>조퇴</th>
                    <th>보강</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="vo">
                    <tr>
                        <td>
                            <a href="/attendance/personalAttendance?studentNo=${vo.studentNo}">${vo.studentNo}</a>
                        </td>
                        <td>${vo.studentName}</td>
                        <td>${vo.teacherNo} - ${vo.teacherName}</td>
                        <td><button class="btn btn-success btn-sm attendance-btn" data-status="출석"
                                onclick="saveAttendance(${vo.studentNo}, '출석', this)">출석</button></td>
                        <td><button class="btn btn-danger btn-sm attendance-btn" data-status="결석"
                                onclick="saveAttendance(${vo.studentNo}, '결석', this)">결석</button></td>
                        <td><button class="btn btn-warning btn-sm attendance-btn" data-status="지각"
                                onclick="saveAttendance(${vo.studentNo}, '지각', this)">지각</button></td>
                        <td><button class="btn btn-info btn-sm attendance-btn" data-status="조퇴"
                                onclick="saveAttendance(${vo.studentNo}, '조퇴', this)">조퇴</button></td>
                        <td><button class="btn btn-primary btn-sm attendance-btn" data-status="보강"
                                onclick="saveAttendance(${vo.studentNo}, '보강', this)">보강</button></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
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

        function changeStatus(button) {
            let row = button.parentNode.parentNode;
            let buttons = row.querySelectorAll('.attendance-btn');

            buttons.forEach(btn => {
                btn.classList.remove('selected');
            });

            button.classList.add('selected');
        }

        function saveAttendance(studentNo, status, button) {
            let attendanceDate = document.getElementById('attendanceDate').value;
            if (!attendanceDate) {
                alert('날짜를 선택해주세요.');
                return;
            }

            if (!studentNo) {
                alert('학생 번호가 없습니다.');
                return;
            }

            const params = new URLSearchParams();
            params.append('studentNo', studentNo);
            params.append('attendanceDate', attendanceDate);
            params.append('attendanceStatus', status);

            fetch('/attendance/save', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: params.toString()
            })
                .then(response => {
                    if (response.ok) {
                        alert('출석 정보가 저장되었습니다.');
                        changeStatus(button);
                    } else {
                        alert('출석 정보 저장에 실패했습니다.');
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('오류가 발생했습니다.');
                });
        }

        document.getElementById('attendanceDate').addEventListener('change', function () {
            let buttons = document.querySelectorAll('.attendance-btn');
            buttons.forEach(btn => {
                btn.classList.remove('selected');
            });
        });
    </script>
</body>

</html>