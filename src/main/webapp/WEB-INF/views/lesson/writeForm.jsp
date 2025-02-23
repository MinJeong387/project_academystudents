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
    <title>수업일지 등록</title>
</head>

<body class="d-flex">
    <div class="col-md-3">
        <jsp:include page="../students/main.jsp" />
    </div>
    <div class="col-md-9 p-3">
        <h1 class="mb-4">수업일지 등록</h1>

        <form id="writeForm" action="/lesson/write" method="POST" class="row g-3">
            <div class="col-md-6">
                <label for="uno" class="form-label">선생님 번호</label>
                <input type="number" class="form-control" id="uno" name="uno" required>
            </div>

            <div class="col-md-6">
                <label for="date" class="form-label">수업 날짜 (YYYY-MM-DD)</label>
                <input type="date" class="form-control" id="date" name="date">
            </div>

            <div class="col-md-12">
                <label for="contents" class="form-label">수업 내용</label>
                <textarea class="form-control" id="contents" name="contents" rows="5"></textarea>
            </div>

            <div class="col-12">
                <button type="submit" class="btn btn-primary">등록</button>
            </div>
        </form>
    </div>
    
   <script>
    // 수업 날짜 필드에 오늘 날짜 기본값 설정
    window.onload = function() {
        console.log("window.onload executed");

        let today = new Date();
        let year = today.getFullYear();
        let month = String(today.getMonth() + 1).padStart(2, '0');
        let day = String(today.getDate()).padStart(2, '0');
        let formattedDate = year + '-' + month + '-' + day;
        document.getElementById('date').value = formattedDate;

        // 세션에서 사용자 번호 가져오기
        let userNo = ${sessionScope.userNo != null ? sessionScope.userNo : 'null'}; // 세션 속성 존재 여부 확인

        console.log("userNo: " + userNo);
        console.log("uno element: " + document.getElementById('uno'));

        // 사용자 번호가 존재하면 선생님 번호 필드에 입력
        if (userNo !== 'null') {
            document.getElementById('uno').value = parseInt(userNo); // 타입 변환
        }
    };
</script>

<%-- 세션 속성 확인 --%>
${sessionScope.userNo}

</body>

</html>