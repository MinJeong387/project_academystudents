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
    <title>상담일지 수정</title>
</head>

<body class="d-flex">
    <div class="col-md-3">
        <jsp:include page="../students/main.jsp" />
    </div>
    <div class="col-md-9 p-3">
        <h1 class="mb-4">상담일지 수정</h1>

        <form id="modifyForm" action="/counseling/modify" method="POST" class="row g-3" onsubmit="return validateForm()">

            <div class="col-md-6">
                <label for="no" class="form-label">순서</label>
                <input type="text" class="form-control" id="no" name="no" value="${vo.no}" readonly>
            </div>
            
            <div class="col-md-6">
                <label for="date" class="form-label">상담 날짜 (YYYY-MM-DD)</label>
                <input type="date" class="form-control" id="date" name="date" value="${vo.date}">
            </div>
            
            <div class="col-md-6">
                <label for="studentName" class="form-label">학생 이름</label>
                <input type="text" class="form-control" id="studentName" name="studentName" value="${vo.studentName}" oninput="getStudentNumbers()">
            </div>

            <div class="col-md-6">
                <label for="sno" class="form-label">학생 번호</label>
                <input type="number" class="form-control" id="sno" name="sno" readonly value="${vo.sno}">
                <select class="form-select" id="snoDropdown" style="display: none;" onchange="selectStudentNumber()">
                    <option value="">학생 번호 선택</option>
                </select>
            </div>            

            <div class="col-md-12">
                <label for="contents" class="form-label">상담 내용</label>
                <textarea class="form-control" id="contents" name="contents" rows="5">${vo.contents}</textarea>
            </div>

            <div class="col-12">
                <button type="submit" class="btn btn-primary">수정</button>
            </div>
        </form>
    </div>

    <script>
        function getStudentNumbers() {
            let studentName = document.getElementById('studentName').value;
            if (studentName) {
                fetch('/counseling/getStudentNumbersByName?studentName=' + studentName)
                    .then(response => response.json())
                    .then(data => {
                        if (data.length === 1) {
                            // 학생 번호가 하나인 경우
                            document.getElementById('sno').value = data[0].no;
                            document.getElementById('snoDropdown').style.display = 'none';
                        } else if (data.length > 1) {
                            // 학생 번호가 여러 개인 경우
                            let dropdown = document.getElementById('snoDropdown');
                            dropdown.innerHTML = '<option value="">학생 번호 선택</option>';
                            data.forEach(student => {
                                let option = document.createElement('option');
                                option.value = student.no;
                                option.text = student.no + ' - ' + student.name;
                                dropdown.appendChild(option);
                            });
                            dropdown.style.display = 'block';
                        } else {
                            // 학생 번호가 없는 경우
                            document.getElementById('sno').value = '';
                            document.getElementById('snoDropdown').style.display = 'none';
                        }
                    });
            } else {
                document.getElementById('sno').value = '';
                document.getElementById('snoDropdown').style.display = 'none';
            }
        }

        function selectStudentNumber() {
            document.getElementById('sno').value = document.getElementById('snoDropdown').value;
            document.getElementById('snoDropdown').style.display = 'none';
        }

        function validateForm() {
            let studentName = document.getElementById('studentName').value;
            let sno = document.getElementById('sno').value;

            if (!studentName || !sno) {
                alert('이름과 번호를 입력해주세요.');
                return false; // 폼 제출 방지
            }
            return true; // 폼 제출 허용
        }
    </script>
</body>

</html>