<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>개인 출석 현황</title>
</head>
<body>
    <h1>개인 출석 현황</h1>
    <c:if test="${not empty attendanceList}">
        <table border="1">
            <thead>
                <tr>
                    <th>날짜</th>
                    <th>상태</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${attendanceList}" var="attendance">
                    <tr>
                        <td>${attendance.attendanceDate}</td>
                        <td>${attendance.attendanceStatus}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
    <c:if test="${empty attendanceList}">
        <p>출석 정보가 없습니다.</p>
    </c:if>

    <script>
        window.onload = function() {
            const urlParams = new URLSearchParams(window.location.search);
            const studentNo = urlParams.get('studentNo');

            fetch(`/attendance/details?studentNo=${studentNo}`)
                .then(response => response.json())
                .then(data => {
                    let attendanceList = document.getElementById('attendanceList');
                    if (data.length > 0) {
                        let table = document.createElement('table');
                        let thead = document.createElement('thead');
                        let tbody = document.createElement('tbody');
                        let headerRow = document.createElement('tr');
                        let dateHeader = document.createElement('th');
                        let statusHeader = document.createElement('th');

                        dateHeader.textContent = '날짜';
                        statusHeader.textContent = '상태';

                        headerRow.appendChild(dateHeader);
                        headerRow.appendChild(statusHeader);
                        thead.appendChild(headerRow);
                        table.appendChild(thead);

                        data.forEach(item => {
                            let row = document.createElement('tr');
                            let dateCell = document.createElement('td');
                            let statusCell = document.createElement('td');

                            dateCell.textContent = item.attendanceDate;
                            statusCell.textContent = item.attendanceStatus;

                            row.appendChild(dateCell);
                            row.appendChild(statusCell);
                            tbody.appendChild(row);
                        });

                        table.appendChild(tbody);
                        attendanceList.appendChild(table);
                    } else {
                        attendanceList.innerHTML = '<p>출석 정보가 없습니다.</p>';
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('출석 정보를 불러오는 데 실패했습니다.');
                });
        };
    </script>
</body>
</html>